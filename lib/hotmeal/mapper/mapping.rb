require 'hotmeal/mapper'
require 'active_support/core_ext/string/inflections'

module Hotmeal
  module Mapper
    class Mapping
      # @param [String] path
      # @param [Hash] options
      def initialize(path, options = {}, &block)
        @path = path
        @options = options
        collection_mapper_class.instance_eval(&block) if block_given?
      end

      # @return [String]
      attr_reader :path

      # @return [Hash]
      attr_reader :options

      def mapper_class
        options[:class] ||= Decorator
      end

      def handler
        options[:handler]
      end

      def collection_mapper_class
        if mapper_class < CollectionDecorator
          mapper_class
        else
          class_name = "#{as}CollectionDecorator".classify
          unless handler.const_defined?(class_name)
            collection_class = Class.new(CollectionDecorator)
            handler.const_set(class_name, collection_class) if handler
            collection_class.item(class: mapper_class)
          end
          handler.const_get(class_name)
        end
      end

      def as
        options[:as] ||= path.to_sym
      end

      # @return [Symbol]
      def reader
        options[:reader] ||= as.to_sym
      end

      def writer
        options[:writer] ||= "#{as}=".to_sym
      end

      def array?
        options[:array]
      end

      def define_accessors(mod)
        mapping = self
        mod = mod.generated_attribute_methods if mod.respond_to?(:generated_attribute_methods)
        mod.module_eval do
          define_method(mapping.reader) { read_attribute(mapping.as) }
          define_method(mapping.writer) { |value| write_attribute(mapping.as, value) }
        end
      end

      # def decorate(node, path = nil)
      def decorate(doc, path = doc.path)
        path = path + self.path
        html = array? ? doc.search(path) : doc.at(path)
        # fail if html == doc
        if array?
          collection_mapper_class.new(html, path)
        else
          mapper_class.new(html, path)
        end
      end
    end
  end
end

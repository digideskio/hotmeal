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
        if block_given?
          collection_mapper_class.instance_eval(&block)
          collection_mapper_class.class_eval do
            include Hotmeal::Mapper::Attributes::Delegation
          end
        end
      end

      # @return [String]
      attr_reader :path

      # @return [Hash]
      attr_reader :options

      def mapper_class
        @mapper_class ||=
          begin
            options[:class] = options[:class].constantize if options[:class].is_a?(String)
            options[:class] || Decorator
          end
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

      def checker
        options[:checker] ||= "#{as}?".to_sym
      end

      def array?
        options[:array]
      end

      def define_accessors(mod)
        mapping = self
        mod.module_eval do
          define_method(mapping.reader) { read_attribute(mapping.as) }
          define_method(mapping.writer) { |value| write_attribute(mapping.as, value) }
          define_method(mapping.checker) { attribute?(mapping.as) }
        end
      end

      # def decorate(node, path = nil)
      # @param [Nokogiri::XML::Node] doc
      def decorate(doc)
        path = doc.path.to_s + self.path
        if array?
          collection_mapper_class.new(doc.search(path), path)
        else
          mapper_class.new(doc.at(path), path)
        end
      end
    end
  end
end

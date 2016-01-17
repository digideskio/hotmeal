require 'hotmeal/mapper'

module Hotmeal
  module Mapper
    class Mapping
      # @param [String] path
      # @param [Hash] options
      def initialize(path, options = {})
        @path = path
        @options = options
      end

      # @return [String]
      attr_reader :path

      # @return [Hash]
      attr_reader :options

      def mapper_class
        options[:class] ||= Decorator
      end

      def collection_mapper_class
        if mapper_class < CollectionDecorator
          mapper_class
        else
          collection_class = Class.new(CollectionDecorator)
          collection_class.item(class: mapper_class)
          collection_class
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
        mod.module_eval do
          define_method(mapping.reader) { read_attribute(mapping.as) }
          define_method(mapping.writer) { |value| write_attribute(mapping.as, value) }
        end
      end

      # def decorate(node, path = nil)
      def decorate(doc, path = doc.path)
        path = path + self.path
        html = array? ? doc.search(path) : doc.at(path)
        fail if html == doc
        if array?
          collection_mapper_class.new(html, path)
        else
          mapper_class.new(html, path)
        end
      end
    end
  end
end

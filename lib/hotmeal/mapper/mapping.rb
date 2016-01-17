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
        puts "Defining #{[mapping.reader, mapping.writer].inspect}"
        # if array?
        # else
        mod.module_eval do
          define_method(mapping.reader) { read_attribute(mapping.path) }
          define_method(mapping.writer) { |value| write_attribute(mapping.path, value) }
        end
        # end
      end

      # def decorate(node, path = nil)
      def decorate(doc, path = doc.path)
        path = path + self.path
        html = array? ? doc.search(path) : doc.at(path)
        fail if html == doc
        puts [:decorate, path, doc.to_s].inspect
        mapper_class.new(html, path)
      end
    end
  end
end

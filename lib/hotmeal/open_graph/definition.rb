require 'hotmeal/open_graph'
require 'hotmeal/inspectable'
require 'active_support/core_ext/string/inflections'

module Hotmeal
  class OpenGraph
    class Definition
      include Hotmeal::Inspectable

      def self.parent
        nil
      end

      # @param [String] name
      # @param [Hash] options
      # @param [Proc] block
      def initialize(name, options = {}, &block)
        @name = name.to_s
        options[:reader] ||= @name
        @options = options
        @block = block
        # @property_class = build_property_class(name, self, &block)
        definition = self
        if property_module.const_defined?(class_name)
          @property_class = property_module.const_get(class_name)
        else
          property = self.property
          property_class = Class.new(superclass) do
            self.property_name = name
            self.property = property
            self.parent = definition
            self
          end
          @property_class = property_module.const_set(class_name, property_class)
          property_class.class_eval do
            with_options(ns: property, module: self) do
              instance_eval(&block) if block
              # property(options[:value]) if options[:value]
            end
          end
        end

      end

      def class_name
        options[:class_name] ||= name.classify
      end

      delegate :const_set, to: 'self.class.parent'

      def superclass
        if structured?
          StructuredProperty
        else
          Property
        end
      end

      def property_module
        options[:module] || OpenGraph
      end

      # @return [String]
      attr_reader :name

      def property
        options[:property] ||= [options[:ns], name].compact.join(':')
      end

      # @return [Hash]
      attr_reader :options

      # @return [Proc]
      attr_reader :block

      # @return [Boolean]
      def array?
        options[:array]
      end

      # @return [Boolean]
      def required?
        options[:array]
      end

      # @return [String]
      def reader
        options[:reader] ||= name
      end

      # @return [String]
      def writer
        options[:writer] ||= "#{reader}="
      end

      # @return [String]
      def variable
        options[:variable] ||= "@#{reader}"
      end

      # @return [String]
      def plural
        options[:plural] ||= reader.pluralize
      end

      attr_reader :property_class

      def structured?
        options[:structured]
      end

      def build
        if array?
          []
        else
          property_class.new(self)
        end
      end
    end
  end
end

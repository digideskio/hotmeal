require 'hotmeal/mapper'
require 'active_support/concern'
require 'active_support/core_ext/class/attribute'
require 'active_model/attribute_methods'

module Hotmeal
  module Mapper
    module Attributes
      extend ActiveSupport::Concern

      include ActiveModel::AttributeMethods

      included do
        # @return [<Mapping>]
        class_attribute :mappings
        self.mappings = []
        attribute_method_suffix '_mapping'
      end

      module Delegation
        def initialize(html = nil, path = nil)
          super(html, path)
          __setobj__(attributes) if has_attributes?
        end
      end

      include Delegation

      # @return [Hash{String => Hotmeal::Mapper::Decorator}]
      def attributes
        @attributes ||= mappings.each_with_object({}) do |mapping, attributes|
          value = read_attribute(mapping)
          attributes[mapping.as] = value if value != nil
        end
      end

      alias_method :to_hash, :attributes

      # @param [Hash{String => Object}] attributes
      def assign_attributes(attributes = {})
        attributes.each do |name, value|
          mapping = attribute_mapping(name.to_s)
          write_attribute(mapping, value)
        end
      end

      alias_method :attributes=, :assign_attributes

      private

      def inspect_attributes
        if has_attributes?
          attributes.map { |key, value| "#{key.inspect}=#{value.inspect}" }.join(' ')
        end
      end

      def has_attributes?
        self.class.mappings.any?
      end

      def read_attribute(path)
        mapping = path.is_a?(Mapping) ? path : attribute_mapping(path)
        mapping.decorate(self)
      end

      alias_method :[], :read_attribute
      alias_method :attribute, :read_attribute

      def write_attribute(path, value)
        decorated_attribute = read_attribute(path)
        decorated_attribute.value = value if decorated_attribute
      end

      alias_method :attribute=, :write_attribute

      # @param [Mapping] path
      def attribute_mapping(path)
        self.class.attribute_mapping(path)
      end

      def attribute?(path)
        read_attribute(path).present?
      end

      module ClassMethods
        def inherited(child)
          child.mappings = child.mappings
        end

        def element(path, options = {}, &block)
          if path.is_a?(Symbol)
            options[:as] ||= path
            path = "/#{path}"
          end
          map(path, options, &block)
        end

        def elements(path, options = {}, &block)
          options[:array] = true
          element(path, options, &block)
        end

        def attribute(path, options = {}, &block)
          if path.is_a?(Symbol)
            options[:as] ||= path
            path = "[@#{path}]/@#{path}"
          end
          map(path, options, &block)
        end

        def map(path, options = {}, &block)
          options[:handler] ||= self
          mapping = Hotmeal::Mapper::Mapping.new(path, options, &block)
          define_attribute(mapping)
          mapping.define_accessors(generated_attribute_methods)
        end

        # @param [Mapping] name
        def attribute_mapping(name)
          name == name.to_sym
          mapping = mappings.find { |mapping| mapping.as == name }
          unless mapping
            mapping = Hotmeal::Mapper::Mapping.new(name)
            define_attribute(mapping)
          end
          mapping
        end

        def define_attribute(mapping)
          self.mappings += [mapping]
          define_attribute_method mapping.as
        end

        private

        # @return [Module]
        def generated_attribute_methods
          @generated_attribute_methods ||=
            begin
              accessors = Module.new { extend Mutex_m }
              const_set(:GeneratedAttributeMethods, accessors)
              prepend(accessors)
              accessors
            end
        end
      end
    end
  end
end

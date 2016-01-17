require 'hotmeal/mapper'
require 'active_support/concern'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  module Mapper
    module Attributes
      extend ActiveSupport::Concern

      included do
        # @return [<Mapping>]
        class_attribute :mappings
        self.mappings = []
      end

      def attributes
        mappings.each_with_object({}) do |mapping, attributes|
          value = read_attribute(mapping)
          attributes[mapping.path] = value if value != nil
        end
      end


      def inspect
        '#<%s:0x%x %s>' % [self.class, object_id, inspect_attributes]
      end

      private


      def inspect_attributes
        if has_attributes?
          attributes.map {|key, value| "#{key.inspect}=#{value.inspect}"}.join(' ')
        end
      end

      def has_attributes?
        self.class.mappings.any?
      end

      def read_attribute(path)
        mapping = path.is_a?(Mapping) ? path : mapping_for(path)
        puts [:read_attribute, mapping].inspect
        mapping.decorate(self)
      end

      def write_attribute(path, value)
        mapping = mapping_for(path)
        decorator = mapping.decorate(self)
        decorator.value = value
      end

      # @param [Mapping] path
      def mapping_for(path)
        self.class.mapping_for(path)
      end

      module ClassMethods
        def inherited(child)
          child.mappings = child.mappings
        end

        def element(path, options = {})
          if path.is_a?(Symbol)
            options[:as] ||= path
            path = "/#{path}"
          end
          attribute(path, options)
        end

        def elements(path, options = {})
          options[:array] = true
          element(path, options)
        end

        def attribute(path, options = {})
          if path.is_a?(Symbol)
            options[:as] ||= path
            path = "[@#{path}]/@#{path}"
          end
          mapping = Hotmeal::Mapper::Mapping.new(path, options)
          self.mappings += [mapping]
          mapping.define_accessors(self)
        end

        # @param [Mapping] path
        def mapping_for(path)
          mapping = mappings.find { |mapping| mapping.path == path }
          unless mapping
            mapping = Hotmeal::Mapper::Mapping.new(path)
            self.mappings += [mapping]
          end
          mapping
        end
      end
    end
  end
end

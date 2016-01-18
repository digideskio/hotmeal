require 'hotmeal/open_graph'
require 'hotmeal/inspectable'
require 'active_support/concern'

module Hotmeal
  class OpenGraph
    module PropertiesMethods
      extend ActiveSupport::Concern
      include Hotmeal::Inspectable

      def property_for(attribute)
        properties[attribute]
      end

      def properties
        @properties ||= Hash.new do |hash, key|
          definition = self.class.definitions[key.to_s]
          hash[key.to_s] = definition ? definition.build : nil
        end
      end

      def to_s
        attributes_for_inspection.map do |attribute|
          value = read_attribute_for_inspection(attribute)
          inspect_attribute(attribute, value) { |value| value.to_s }
        end.compact.join(attributes_glue)
      end

      private

      def inspect_attributes
        attributes_for_inspection.map do |attribute|
          value = read_attribute_for_inspection(attribute)
          inspect_attribute(attribute, value)
        end.compact.join(' ')
      end

      def read_attribute_for_inspection(property)
        property_for(property)
      end

      module ClassMethods
        def definitions
          @definitions ||= {}
        end
        
        # @macro [attach] object_types
        #   @method $1?()
        #   @return [Boolean] is graph object $1?
        def object_type(ns, name = nil, options = {}, &block)
          if name
            method = "#{ns}_#{name}?"
            type = "#{ns}.#{name}"
            if ns
              ns_check = "#{ns}?"
              define_method(ns_check) { self.type =~ /^#{ns}/ } unless instance_methods.include?(ns_check)
            end
          else
            name = ns
            ns = nil
            method = "#{name}?"
            type = name
          end
          define_method(method) { self.type == type }
          ns(ns || name, &block) if block_given?
        end
      end
    end
  end
end

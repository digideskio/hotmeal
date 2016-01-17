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
        def ns(name, uri = nil, &block)
          if block.arity == 1
            with_options(ns: name, uri: uri, &block)
          else
            with_options(ns: name, uri: uri) { |wo| wo.instance_eval(&block) }
          end
        end

        def definitions
          @definitions ||= {}
        end

        # @macro [attach] properties
        #   @method $1()
        #   @return [String] OpenGraph $1 property
        def property(name, options = {}, &block)
          options[:structured] = true if block || block_given?
          definition = Definition.new(name, options, &block)
          definitions[definition.property] = definition

          self.inspectable_attributes += [definition.property]

          if definition.array?
            define_method(definition.plural) { properties[definition.property] ||= [] }
            define_method(definition.reader) { public_send(definition.plural).first }
            define_method(definition.writer) do |value|
              if public_send(definition.plural).any?
                public_send(definition.reader).try(:content=, value)
              else
                properties[definition.property]
              end
            end
          else
            define_method(definition.reader) { properties[definition.property] }
            define_method(definition.writer) { |value| publc_send(definition.reader).try(:content=, value) }
          end
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

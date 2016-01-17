require 'hotmeal/open_graph'
require 'active_support/concern'

module Hotmeal
  class OpenGraph
    module PropertiesMethods
      extend ActiveSupport::Concern
      include Inspectable

      def properties
        @properties ||= Hash.new do |hash, key|
          definition = self.class.definitions[key.to_s]
          hash[key.to_s] = definition ? definition.build : nil
        end
      end

      def property_for(property)
        properties[property]
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

          self.inspectable_attributes += [definition.reader]

          if definition.array?
            define_method(definition.plural) do
              puts "#{self.class}##{definition.plural}"
              properties[definition.property] ||= []
            end
            define_method(definition.reader) do
              puts "#{self.class}##{definition.reader}"
              public_send(definition.plural).first
            end
            define_method(definition.writer) do |value|
              puts "#{self.class}##{definition.writer}"
              if public_send(definition.plural).any?
                public_send(definition.reader).try(:content=, value)
              else
                properties[definition.property]
              end
            end
          else
            define_method(definition.reader) do
              puts "#{self.class}##{definition.reader}"
              properties[definition.property]
            end
            define_method(definition.writer) do |value|
              puts "#{self.class}##{definition.writer}"
              publc_send(definition.reader).try(:content=, value)
            end
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

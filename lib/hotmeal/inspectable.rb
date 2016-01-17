require 'hotmeal'
require 'active_support/concern'

module Hotmeal
  module Inspectable
    extend ActiveSupport::Concern

    included do
      class_attribute :inspectable_attributes
      self.inspectable_attributes = []
      class_attribute :attribute_glue
      self.attribute_glue = ' '
      class_attribute :attributes_glue
      self.attributes_glue = "\n"
    end

    def inspect
      '#<%s:0x%x %s>' % [self.class, object_id, inspect_attributes]
    end

    def to_s
      inspectable_attributes.map do |attribute|
        value = read_attribute_for_inspection(attribute)
        "#{attribute}#{attribute_glue}#{value.inspect}" if value
      end.compact.join(attributes_glue)
    end

    private

    def inspect_attribute(name, value, &inspection)
      inspection ||= ->(value) { value.inspect }
      return unless inspectable?(value)
      case value
      when Array
        value.map do |item|
          inspection.call(item) if inspectable?(item)
        end.compact.join("\n")
      else
        inspection.call(value)
      end
    end

    def inspectable?(property)
      (property.respond_to?(:any?) && property.any?) ||
        (property.respond_to?(:inspectable?) && property.inspectable?)
    end

    def inspect_attributes
      attributes_for_inspection.map do |attribute|
        value = read_attribute_for_inspection(attribute)
        '@%s=%s' % [attribute, value.inspect] if value
      end.compact.join(' ')
    end

    def read_attribute_for_inspection(attribute)
      public_send(attribute)
    end

    def attributes_for_inspection
      if inspectable_attributes.any?
        inspectable_attributes
      else
        instance_variables.map { |s| s[1..-1] }
      end
    end

    def indent(text, blank = 2)
      text.to_s.split(/\n/).join("\n" << (' ' * blank))
    end
  end
end

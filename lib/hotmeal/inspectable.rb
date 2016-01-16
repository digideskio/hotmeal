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
        value = public_send(attribute)
        "#{attribute}#{attribute_glue}#{value.inspect}" if value
      end.compact.join(attributes_glue)
    end

    private

    def inspect_attributes
      attributes = inspectable_attributes
      attributes = instance_variables.map { |s| s[1..-1] } unless attributes.any?
      attributes.map do |attribute|
        value = public_send(attribute)
        '@%s=%s' % [attribute, value.inspect] if value
      end.compact.join(' ')
    end

    def indent(text, blank = 2)
      text.to_s.split(/\n/).join("\n" << (' ' * blank))
    end
  end
end

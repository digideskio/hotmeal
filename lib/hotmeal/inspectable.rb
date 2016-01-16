require 'hotmeal'
require 'active_support/concern'

module Hotmeal
  module Inspectable
    extend ActiveSupport::Concern

    included do
      class_attribute :inspectable_attributes
      self.inspectable_attributes = []
    end

    def inspect
      '#<%s:0x%x %s>' % [self.class, object_id, inspect_attributes]
    end

    def to_s
      inspectable_attributes.map do |attribute|
        value = public_send(attribute)
        '%s: %s' % [attribute, value.to_s] if value
      end.compact.join("\n")
    end

    private

    def inspect_attributes
      attributes = inspectable_attributes
      attributes = instance_variable_names.map { |s| s[1..-1] } unless attributes.any?
      attributes.map do |attribute|
        value = public_send(attribute)
        '@%s=%s' % [attribute, value.inspect] if value
      end.compact.join(' ')
    end

    def indent(text, blank = 2)
      text.to_s.split(/\n/).join("\n" << (' ' * blank))
    rescue ArgumentError
      puts text
    end
  end
end

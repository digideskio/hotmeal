require 'hotmeal/micro_data'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  module MicroData
    class Object
      class_attribute :vocab
      class_attribute :typeof
      class_attribute :properties
      self.properties = {}

      def self.inherited(child)
        super
        child.properties = properties.dup
      end

      def self.property(name, options = {})
        properties[name] = Property.new(name, options.merge(from: self))
      end

      def self.url
        "#{vocab}#{typeof}"
      end

      def url
        "#{vocab}#{typeof}"
      end
    end
  end
end

require 'hotmeal'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  module MicroData
    class Object
      class_attribute :url
      class_attribute :properties
      self.properties = {}

      def self.inherited(child)
        super
        child.properties = properties.dup
      end

      def self.property(name, options={})
        properties[name] = options.merge(from: self)
      end
    end
  end
end

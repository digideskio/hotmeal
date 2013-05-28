require 'hotmeal'
require 'hotmeal/micro_data'
require 'active_support'
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/string'
require 'active_support/core_ext/module/attribute_accessors'

module Hotmeal
  module Schema
    extend ActiveSupport::Autoload

    #include MicroData::DataTypes

    mattr_accessor :types
    self.types = {}

    class BasicObject < MicroData::Object
      def self.inherited(child)
        super
        child.url = "http://schema.org/#{child.name.demodulize}"
        Schema.types[child.url] = child
      end
    end
  end
end

require 'hotmeal/schema/autoload'

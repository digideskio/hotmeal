require 'active_support'
module Hotmeal
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :CollectionMapper
  autoload :Document
  autoload :ElementMapper
  autoload :Meta
  autoload :MethodsModule
  autoload :MicroData
  autoload :Node
  autoload :OpenGraph
  autoload :Schema
  autoload :SchemaGenerator
end

require 'hotmeal/version'
require 'hotmeal/base'
require 'hotmeal/schema'

def Hotmeal(html)
  Hotmeal::Base.new(html)
end

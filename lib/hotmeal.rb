require 'active_support'
module Hotmeal
  extend ActiveSupport::Autoload

  autoload :Body
  autoload :CollectionMapper
  autoload :Document
  autoload :ElementMapper
  autoload :Inspectable
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
  Hotmeal::Document.new(html)
end

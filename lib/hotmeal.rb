require 'active_support'
module Hotmeal
  extend ActiveSupport::Autoload

  autoload :Body
  autoload :CollectionMapper
  autoload :Document
  autoload :ElementMapper
  autoload :Inspectable
  autoload :Links
  autoload :Mapper
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

def Hotmeal(html, base_uri = nil)
  Hotmeal::Document.new(html, base_uri)
end

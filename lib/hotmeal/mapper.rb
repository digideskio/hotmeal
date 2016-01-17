require 'hotmeal'
require 'delegate'
require 'nokogiri'

module Hotmeal
  module Mapper
    extend ActiveSupport::Autoload

    autoload :AbstractDecorator
    autoload :Attributes
    autoload :CollectionDecorator
    autoload :Decorator
    autoload :Document
    autoload :Html
    autoload :Inspectable
    autoload :Mapping
    autoload :Head, 'hotmeal/mapper/document'
    autoload :Body, 'hotmeal/mapper/document'
    autoload :Meta, 'hotmeal/mapper/document'
    autoload :Link, 'hotmeal/mapper/document'

    def self.new(html = nil, path = nil, &block)
      Decorator.new(html, path, &block)
    end
  end
end

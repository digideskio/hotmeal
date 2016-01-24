require 'hotmeal'
require 'delegate'
require 'nokogiri'

module Hotmeal
  module Mapper
    extend ActiveSupport::Autoload

    autoload :AbstractDecorator
    autoload :Attributes
    autoload :Collection
    autoload :Decorator
    autoload :Html
    autoload :Inspectable
    autoload :Mapping
    autoload :Scrubber
    autoload :SlimRepresentation

    def self.new(html = nil, path = nil, &block)
      Decorator.new(html, path, &block)
    end
  end
end

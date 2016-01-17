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
    autoload :Mapping
    autoload :Head, 'hotmeal/mapper/document'
    autoload :Body, 'hotmeal/mapper/document'
    autoload :Meta, 'hotmeal/mapper/document'
    autoload :Link, 'hotmeal/mapper/document'

    def self.new(*args, &block)
      Decorator.new(*args, &block)
    end
  end
end

require 'hotmeal/mapper/attributes'

module Hotmeal
  module Mapper
    class Decorator
      include Hotmeal::Mapper::Attributes
    end
  end
end

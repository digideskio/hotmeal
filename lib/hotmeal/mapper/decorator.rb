require 'hotmeal/mapper'
require 'hotmeal/mapper/abstract_decorator'

module Hotmeal
  module Mapper
    class Decorator < AbstractDecorator
      extend ActiveSupport::Autoload

      autoload :Attributes
      autoload :Html

      include Hotmeal::Mapper::Html
      include Hotmeal::Mapper::Attributes
      include Hotmeal::Mapper::Scrubber
    end
  end
end

require 'hotmeal/mapper'
require 'hotmeal/mapper/abstract_decorator'

module Hotmeal
  module Mapper
    class Decorator < AbstractDecorator
      include Hotmeal::Mapper::Html
      include Hotmeal::Mapper::Attributes
      include Hotmeal::Mapper::Scrubber
      include Hotmeal::Mapper::Microdata
    end
  end
end

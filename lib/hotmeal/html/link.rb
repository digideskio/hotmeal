require 'hotmeal/html'

module Hotmeal
  module Html
    class Link < Hotmeal::Mapper::Decorator
      attribute :rel
      attribute :href
      attribute :hreflang
      attribute :media
      attribute :sizes
      attribute :type
    end
  end
end

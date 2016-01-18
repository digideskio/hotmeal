require 'hotmeal/html'

module Hotmeal
  module Html
    class A < Hotmeal::Mapper::Decorator
      attribute :href
      attribute :title
      attribute :rel
    end
  end
end

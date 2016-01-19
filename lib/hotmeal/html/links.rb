require 'hotmeal/html'

module Hotmeal
  module Html
    class Links < Hotmeal::Mapper::CollectionDecorator
      item class: Link
    end
  end
end

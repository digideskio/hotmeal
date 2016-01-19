require 'hotmeal/html'

module Hotmeal
  module Html
    class Links < Hotmeal::Mapper::Collection
      decorate_items_with Link
    end
  end
end

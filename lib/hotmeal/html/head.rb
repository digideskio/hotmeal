require 'hotmeal/html'

module Hotmeal
  module Html
    class Head < Mapper::Decorator
      element :title
      attribute '/base/@href', as: :base_uri
      elements :meta, class: MetaData
      elements :link, class: Links, as: :links
    end
  end
end

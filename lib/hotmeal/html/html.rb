require 'hotmeal/html'
require 'hotmeal/mapper/decorator'

module Hotmeal
  module Html
    class Html < Hotmeal::Mapper::Decorator
      self.path = '/html'

      attribute 'html[@prefix]/@prefix', as: :prefix

      element :head, class: Head
      element :body, class: Body
    end
  end
end

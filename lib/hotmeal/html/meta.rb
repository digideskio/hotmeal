require 'hotmeal/html'

module Hotmeal
  module Html
    class Meta < Hotmeal::Mapper::Decorator
      attribute :charset
      attribute :name
      attribute :property
      attribute :content
      attribute :'http-equiv', as: :http_equiv
    end
  end
end

require 'hotmeal/mapper/decorator'

module Hotmeal
  module Mapper
    class Meta < Decorator
      attribute :charset
      attribute :name
      attribute :property
      attribute :content
      attribute :'http-equiv', as: :http_equiv
    end

    class MetaData < CollectionDecorator
      item class: Meta
      attribute '[@charset]/@charset', as: :charset
      elements '[@name and boolean(@content)]', class: Meta, as: :name
      elements '[@property and boolean(@content)]', class: Meta, as: :property
      elements '[@http-equiv and boolean(@content)]', class: Meta, as: :http_equiv
    end

    class Link < Decorator
      attribute :rel
      attribute :href
      attribute :hreflang
      attribute :media
      attribute :sizes
      attribute :type
    end

    class Links < CollectionDecorator
      item class: Link
    end

    class Head < Decorator
      element :title
      attribute '/base/@href', as: :base_uri
      elements :meta, class: Hotmeal::Mapper::MetaData
      elements :link, class: Hotmeal::Mapper::Links, as: :links
    end

    class Body < Decorator
    end

    class Document < Decorator
      self.path = '/html'

      attribute 'html[@prefix]/@prefix', as: :prefix

      element :head, class: Hotmeal::Mapper::Head
      element :body, class: Hotmeal::Mapper::Body
    end
  end
end

require 'hotmeal/html'

module Hotmeal
  module Html
    class Head < Mapper::Decorator
      element :title
      attribute '/base[@href]/@href', as: :base_uri
      elements :meta, class: MetaData
      elements :link, class: Links, as: :links

      def base_uri
        @base_uri ||= (uri = super) ? URI(uri.to_s) : nil
      end

      def base_uri=(uri)
        remove_instance_variable(:@base_uri)
        super(uri)
      end
    end
  end
end

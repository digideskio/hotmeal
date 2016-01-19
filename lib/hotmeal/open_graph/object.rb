require 'hotmeal/mapper/decorator'

module Hotmeal
  class OpenGraph
    class Object < Hotmeal::Mapper::Decorator
      extend DSL

      ns :og, 'http://ogp.me/ns#' do
        property :title, required: true
        property :type, required: true
        property :image, required: true, array: true, value: :url, as: :images, class: Collection.of(Image)
        property :url, required: true
        property :audio, value: :url, class: Struct::Audio
        property :description
        property :determiner
        property :locale, class: Locale
        property :site_name
        property :video, class: Video
      end

      ns :fb, 'http://ogp.me/ns/fb#' do
        property :app_id
      end
    end
  end
end

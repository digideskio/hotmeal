require 'hotmeal'
require 'hotmeal/collection_mapper'
require 'active_support/core_ext/object/with_options'

module Hotmeal
  class OpenGraph < Hotmeal::Mapper::CollectionDecorator
    extend ActiveSupport::Autoload

    autoload :AudioProperty
    autoload :Collection
    autoload :DSL, 'hotmeal/open_graph/dsl'
    autoload :ImageProperty
    autoload :LocaleProperty
    autoload :Property
    autoload :StructuredProperty
    autoload :VideoProperty

    extend DSL

    item class: Html::Meta

    def image
      images.first
    end

    def og_properties
      collection.map { |node| [node.property, node.content] }
    end

    ns :og, 'http://ogp.me/ns#' do
      property :title, required: true
      property :type, required: true
      property :image, required: true, array: true, value: :url, as: :images, class: Collection.of(ImageProperty)
      property :url, required: true

      property :audio, value: :url, class: AudioProperty
      property :description
      property :determiner
      property :locale, class: LocaleProperty
      property :site_name
      property :video, class: VideoProperty do
        property :url
        property :secure_url
        property :type
        property :width, type: Integer
        property :height, type: Integer
      end
    end

    ns :fb, 'http://ogp.me/ns/fb#' do
      property :app_id
    end

    #   # @!group Object Types
    #   object_type(:music, :song) do
    #     property :duration, type: Integer
    #     property :album, type: Array do
    #       property :disc, type: Integer
    #       property :track, type: Integer
    #     end
    #     property :musician, type: Array
    #   end
    #
    #   object_type :music, :album do
    #     property :song do
    #       property :disc, type: Integer
    #       property :track, type: Integer
    #     end
    #     property :musician, type: Array
    #     property :release_date, type: DateTime
    #   end
    #
    #   object_type :music, :playlist do
    #     property :song do
    #       property :disc, type: Integer
    #       property :track, type: Integer
    #     end
    #     property :creator, type: :profile
    #   end
    #
    #   object_type :music, :radio_station do
    #     property :creator, type: :profile
    #   end
    #
    #   object_type :video, :movie do
    #     property :actor, type: Array do
    #       property :role
    #     end
    #     property :director, type: Array
    #     property :writer, type: Array
    #     property :duration, type: Integer
    #     property :release_date, type: DateTime
    #     property :tag, type: Array
    #   end
    #
    #   object_type :video, :episode do
    #     property :actor, type: Array do
    #       property :role
    #     end
    #     property :director, type: Array
    #     property :writer, type: Array
    #     property :duration, type: Integer
    #     property :release_date, type: DateTime
    #     property :tag, type: Array
    #     property :series, type: 'video.tv_show'
    #   end
    #
    #   object_type :video, :tv_show do
    #     property :actor, type: Array do
    #       property :role
    #     end
    #     property :director, type: Array
    #     property :writer, type: Array
    #     property :duration, type: Integer
    #     property :release_date, type: DateTime
    #     property :tag, type: Array
    #   end
    #
    #   object_type :video, :other do
    #     property :actor, type: Array do
    #       property :role
    #     end
    #     property :director, type: Array
    #     property :writer, type: Array
    #     property :duration, type: Integer
    #     property :release_date, type: DateTime
    #     property :tag, type: Array
    #   end
    #
    #   object_type :article do
    #     property :published_time, type: DateTime
    #     property :modified_time, type: DateTime
    #     property :expiration_time, type: DateTime
    #     property :author, type: Array
    #     property :section
    #     property :tag, type: Array
    #   end
    #
    #   object_type :book do
    #     property :author, type: Array
    #     property :isbn
    #     property :release_date, type: DateTime
    #     property :tag, type: Array
    #   end
    #
    #   object_type :profile do
    #     property :first_name
    #     property :last_name
    #     property :username
    #     property :gender
    #   end
    #   object_type :website
  end
end

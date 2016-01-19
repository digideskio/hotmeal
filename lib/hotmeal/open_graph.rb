require 'hotmeal'
require 'hotmeal/collection_mapper'
require 'active_support/core_ext/object/with_options'

module Hotmeal
  class OpenGraph < Hotmeal::Mapper::Collection
    extend ActiveSupport::Autoload

    autoload :Article
    autoload :Book
    autoload :DSL, 'hotmeal/open_graph/dsl'
    autoload :Locale
    autoload :Music
    autoload :Object
    autoload :Profile
    autoload :Property
    autoload :Struct
    autoload :Video
    autoload :Website

    Url = Struct::Url
    Image = Struct::Image

    extend DSL

    Collection = Hotmeal::Mapper::Collection
    decorate_items_with Html::Meta

    def process
      Kernel.puts at('meta[@property="og:type"]/@content')
    end

    def object
      @object ||= Object.new(html, path)
    end

    def image
      images.first
    end

    def og_properties
      collection.map { |node| [node.property, node.content] }
    end

    def present?
      og_properties.any?
    end

    ns :og, 'http://ogp.me/ns#' do
      property :title, required: true
      property :type, required: true
      property :image, required: true, array: true, value: :url, as: :images, class: Collection.of(Image)
      property :url, required: true
      property :audio, class: Struct::Audio
      property :description
      property :determiner
      property :locale, class: Locale
      property :site_name
      property :video, class: Video
    end

    ns :fb, 'http://ogp.me/ns/fb#' do
      property :app_id
    end

    # @!group Object Types
    object_type :music, :song, class: Music::Song
    object_type :music, :album, class: Music::Album
    object_type :music, :playlist, class: Music::Playlist
    object_type :music, :radio_station, class: Music::RadioStation
    object_type :video, :movie, class: Video::Movie
    object_type :video, :episode, class: Video::Episode
    object_type :video, :tv_show, class: Video::TvShow
    object_type :video, :other, class: Video::Other
    object_type :article, class: Article
    object_type :book, class: Book
    object_type :profile, class: Profile
    object_type :website, class: Website
  end
end

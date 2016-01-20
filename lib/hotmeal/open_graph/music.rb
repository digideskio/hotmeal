require 'hotmeal/open_graph'
require 'hotmeal/open_graph/object'

module Hotmeal
  class OpenGraph
    module Music
      class Song < Object
        ns :music, 'http://ogp.me/ns/music#' do
          property :duration, type: Integer
          struct :album, class: Collection.of(Struct::Music::Album), array: true, as: :albums
          property :preview_url, class: Struct::Url
          property :musician, class: Collection.of(Profile), array: true
        end

        def album
          albums.first
        end
      end

      class Album < Object
        property :song, class: Struct::Music::Song
        property :musician, class: Collection.of(Profile), array: true
        property :release_date, type: DateTime
      end

      class Playlist < Object
        property :song, class: Song do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :creator, class: Profile
      end

      class RadioStation < Object
        property :creator, class: Profile
      end
    end
  end
end

require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    module Music
      class Song < Struct
        property :duration, type: Integer
        property :album, class: Collection.of('Hotmeal::OpenGraph::Music::Album'), array: true do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :musician, class: Collection.of(Profile), array: true
      end

      class Album < Struct
        property :song, class: Song do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :musician, class: Collection.of(Profile), array: true
        property :release_date, type: DateTime
      end

      class Playlist < Struct
        property :song, class: Song do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :creator, class: Profile
      end

      class RadioStation < Struct
        property :creator, class: Profile
      end
    end
  end
end

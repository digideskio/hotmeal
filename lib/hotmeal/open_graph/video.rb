require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    module Video
      class Actor < Profile
        property :role
      end

      class Movie < Object
        property :actor, array: true, class: Collection.of(Actor)
        property :director, array: true, class: Collection.of(Profile)
        property :writer, array: true, class: Collection.of(Profile)
        property :duration, type: Integer
        property :release_date, type: DateTime
        property :tag, array: true
      end

      class TvShow < Movie
      end

      class Episode < Movie
        property :series, class: TvShow
      end

      class Other < Movie
      end
    end
  end
end

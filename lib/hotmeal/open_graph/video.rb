require 'hotmeal/open_graph/url'

module Hotmeal
  class OpenGraph
    class Video < Url
      property :width, type: Integer
      property :height, type: Integer

      alias_property :url

      class Actor < Profile
        property :role
      end

      class Movie < Struct
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

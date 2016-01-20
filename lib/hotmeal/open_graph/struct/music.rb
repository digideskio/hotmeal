require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Struct
      module Music
        class Song < Struct
          property :url, required: true
          alias_property :url

          property :disc, type: Integer
          property :track, type: Integer
        end

        class Album < Struct
          property :url, required: true
          alias_property :url

          property :disc, type: Integer
          property :track, type: Integer
        end
      end
    end
  end
end

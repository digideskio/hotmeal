require 'hotmeal/open_graph/struct/url'

module Hotmeal
  class OpenGraph
    class Struct
      class Video < Url
        property :width, type: Integer
        property :height, type: Integer

        alias_property :url
      end
    end
  end
end

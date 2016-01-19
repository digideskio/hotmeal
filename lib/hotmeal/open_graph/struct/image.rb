require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Struct
      class Image < Url
        property :width, type: Integer
        property :height, type: Integer

        alias_property :url
      end
    end
  end
end

require 'hotmeal/open_graph/url'

module Hotmeal
  class OpenGraph
    class Image < Url
      property :width, type: Integer
      property :height, type: Integer

      alias_property :url
    end
  end
end

require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Image < Struct
      property :url
      property :secure_url
      property :type
      property :width, type: Integer
      property :height, type: Integer

      alias_property :url
    end
  end
end

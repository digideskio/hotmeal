require 'hotmeal/open_graph/structured_property'

module Hotmeal
  class OpenGraph
    class VideoProperty < StructuredProperty
      property :url
      property :secure_url
      property :type
      property :width, type: Integer
      property :height, type: Integer
    end
  end
end

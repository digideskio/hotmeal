require 'hotmeal/open_graph/structured_property'

module Hotmeal
  class OpenGraph
    class Audio < StructuredProperty
      property :url
      property :secure_url
      property :type
    end
  end
end

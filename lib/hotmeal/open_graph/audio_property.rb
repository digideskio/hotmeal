require 'hotmeal/open_graph/structured_property'

module Hotmeal
  class OpenGraph
    class AudioProperty < StructuredProperty
      property :url
      property :secure_url
      property :type
    end
  end
end

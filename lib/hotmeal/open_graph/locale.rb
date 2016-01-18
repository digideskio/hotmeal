require 'hotmeal/open_graph/structured_property'

module Hotmeal
  class OpenGraph
    class Locale < StructuredProperty
      property :alternate, array: true
    end
  end
end

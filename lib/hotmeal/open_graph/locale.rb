require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Locale < Struct
      property :alternate, array: true
    end
  end
end

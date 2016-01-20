require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Struct
      class Profile < Struct
        property :url

        alias_property :url
      end
    end
  end
end

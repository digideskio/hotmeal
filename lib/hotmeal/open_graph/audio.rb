require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Audio < Struct
      property :url
      property :secure_url
      property :type

      alias_property :url
    end
  end
end

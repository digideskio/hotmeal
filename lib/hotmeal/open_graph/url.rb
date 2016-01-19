require 'hotmeal/open_graph/struct'

module Hotmeal
  class OpenGraph
    class Url < Struct
      property :url, required: true
      property :secure_url
      property :type

      alias_property :url
    end
  end
end

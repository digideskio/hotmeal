require 'hotmeal/open_graph'
require 'hotmeal/open_graph/property'
require 'hotmeal/open_graph/properties_methods'
require 'delegate'

module Hotmeal
  class OpenGraph
    class StructuredProperty < Property
      include PropertiesMethods
    end
  end
end

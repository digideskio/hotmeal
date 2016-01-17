require 'hotmeal/open_graph'
require 'hotmeal/open_graph/property'
require 'hotmeal/open_graph/properties_methods'
require 'delegate'

module Hotmeal
  class OpenGraph
    class StructuredProperty < Property
      include PropertiesMethods

      def inspect
        <<-END
#(
  #{definition.property}=#{__getobj__}
  #{indent(properties.values.compact.map(&:inspect).join("\n"), 4)}
)
        END
      end

      def to_s
        '%s %s' % [definition.property, __getobj__]
      end
    end
  end
end

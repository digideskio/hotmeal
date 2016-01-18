require 'hotmeal/open_graph/property'

module Hotmeal
  class OpenGraph
    class StructuredProperty < Property
      def self.property(*args)
        attribute(*args)
      end

      def read_attribute(name)
        @attributes[name]
      end

      def write_attribute(name, value)
        @attributes[name] = value
      end

      def attributes
        @attributes ||= {}
      end

      def process
        super
        @attributes = {}
        element = @html.parent
        while property?(element = element.next_element)
          attribute = element[:property].to_s.gsub(property_regexp, '')
          public_send("#{attribute}=", element[:content])
        end
      end

      def property?(element)
        return unless html_content
        element[:property].to_s =~ property_regexp
      end

      def property_regexp
        @property_regexp ||= /#{name}:/
      end

      def __getobj__
        html_content
      end
    end
  end
end

require 'hotmeal/html'

module Hotmeal
  module Html
    class OpenGraph < Hotmeal::Mapper::CollectionDecorator
      class Property < Hotmeal::Mapper::Decorator
        def name
          html_element[:property]
        end

        private

        def html_element
          @html.parent
        end
      end

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

      class ImageProperty < StructuredProperty
        property :url
        property :secure_url
        property :type
        property :width, type: Integer
        property :height, type: Integer
      end

      class AudioProperty < StructuredProperty
        property :url
        property :secure_url
        property :type
      end

      item class: Meta

      %i(title description url type).each do |property|
        attribute "[@property='og:#{property}']/@content", as: property, class: Property
      end
      {
        image: ImageProperty,
        audio: AudioProperty
      }.each do |property, mapper|
        attribute "[@property='og:#{property}']/@content", as: property, class: mapper
      end
      attribute "[@property='fb:app_id']/@content", as: :app_id, class: Property

      def og_properties
        collection.map { |node| [node.property, node.content] }
      end
    end
  end
end

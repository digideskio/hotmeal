require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    class GraphObject
      HREF = 'http://ogp.me/ns#'

      DateTime = Time

      include Hotmeal::Inspectable
      extend Hotmeal::OpenGraph::PropertiesMethods

      def initialize(doc)
        @doc = doc
      end

      # @!group Basic metadata
      property :title
      property :type, default: 'website'
      property :image do
        property :url
        property :secure_url
        property :type
        property :width, type: Integer
        property :height, type: Integer
      end
      property :url

      # @!group Optional metadata
      property :description
      property :site_name
      property :determiner
      property :locale do
        property :alternate, type: Array
      end

      property :audio do
        property :url
        property :secure_url
        property :type
      end

      property :video do
        property :url
        property :secure_url
        property :type
        property :width, type: Integer
        property :height, type: Integer
      end

      # @!group Object Types
      object_type :music, :song do
        property :duration, type: Integer
        property :album, type: Array do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :musician, type: Array
      end

      object_type :music, :album do
        property :song do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :musician, type: Array
        property :release_date, type: DateTime
      end

      object_type :music, :playlist do
        property :song do
          property :disc, type: Integer
          property :track, type: Integer
        end
        property :creator, type: :profile
      end

      object_type :music, :radio_station do
        property :creator, type: :profile
      end

      object_type :video, :movie do
        property :actor, type: Array do
          property :role
        end
        property :director, type: Array
        property :writer, type: Array
        property :duration, type: Integer
        property :release_date, type: DateTime
        property :tag, type: Array
      end

      object_type :video, :episode do
        property :actor, type: Array do
          property :role
        end
        property :director, type: Array
        property :writer, type: Array
        property :duration, type: Integer
        property :release_date, type: DateTime
        property :tag, type: Array
        property :series, type: 'video.tv_show'
      end

      object_type :video, :tv_show do
        property :actor, type: Array do
          property :role
        end
        property :director, type: Array
        property :writer, type: Array
        property :duration, type: Integer
        property :release_date, type: DateTime
        property :tag, type: Array
      end

      object_type :video, :other do
        property :actor, type: Array do
          property :role
        end
        property :director, type: Array
        property :writer, type: Array
        property :duration, type: Integer
        property :release_date, type: DateTime
        property :tag, type: Array
      end

      object_type :article do
        property :published_time, type: DateTime
        property :modified_time, type: DateTime
        property :expiration_time, type: DateTime
        property :author, type: Array
        property :section
        property :tag, type: Array
      end

      object_type :book do
        property :author, type: Array
        property :isbn
        property :release_date, type: DateTime
        property :tag, type: Array
      end

      object_type :profile do
        property :first_name
        property :last_name
        property :username
        property :gender
      end
      object_type :website

      protected

      attr_reader :doc

      def property(name, options = {})
        key = if options[:ns]
                "#{options[:ns]}:#{name}"
              else
                name
              end
        options[:type] ||= String
        (properties[key] || options[:default]).tap do |property|
          case options[:type]
          when DateTime
            DateTime.xmlschema(property)
          else
            property
          end
        end
      end

      def prefix
        @prefix ||= if (prefix = @doc.html_prefix.key(HREF))
                      prefix
                    else
                      'og'
                    end
      end

      def properties
        @properties ||= begin
          prefix = /^#{self.prefix}:/
          doc.meta.properties.inject({}) do |result, (property, content)|
            result[property.gsub(prefix, '').to_sym] = content if property =~ prefix
            result
          end
        end
      end
    end
  end
end

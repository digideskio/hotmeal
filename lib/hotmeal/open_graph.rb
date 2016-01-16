require 'hotmeal'
require 'hotmeal/collection_mapper'
require 'active_support/core_ext/object/with_options'

module Hotmeal
  class OpenGraph < Hotmeal::CollectionMapper
    autoload :GraphObject, 'hotmeal/open_graph/graph_object'
    autoload :PropertiesMethods, 'hotmeal/open_graph/properties_methods'
    autoload :Property, 'hotmeal/open_graph/property'

    collect('[@property and boolean(@content)]', as: :og_properties, use: [:property, :content])

    def process
      og_properties.each do |key, value|
        writer = "#{key}="
        if self.respond_to?(writer)
          public_send(writer, value)
        end
        if key =~ /([\w_]+:([\w_]+)):([\w_]+)/
          public_send($2).public_send("#{$3}=", value)
        end
      end
    end

    def object
      @object ||= GraphObject.new(self)
    end

    def to_s
      inspectable_attributes.map do |attribute|
        value = public_send(attribute)
        '%s: %s' % [attribute, value.to_s] if value
      end.compact.join("\n")
    end

    extend Hotmeal::OpenGraph::PropertiesMethods

    property :title, required: true
    property :type, required: true
    property :image, required: true do
      property :url
      property :secure_url
      property :type
      property :width, type: Integer
      property :height, type: Integer
    end
    property :url, required: true

    property :audio do
      property :url
      property :secure_url
      property :type
    end
    property :description
    property :determiner
    property :locale do
      property :alternate, type: Array
    end
    property :site_name
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
  end
end

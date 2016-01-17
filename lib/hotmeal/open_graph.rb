require 'hotmeal'
require 'hotmeal/collection_mapper'
require 'active_support/core_ext/object/with_options'

module Hotmeal
  class OpenGraph < Hotmeal::CollectionMapper
    extend ActiveSupport::Autoload

    autoload :Definition
    autoload :PropertiesMethods
    autoload :Property
    autoload :StructuredProperty

    collect('[@property and boolean(@content)]', as: :og_properties, use: [:property, :content])

    def process
      og_properties.each do |key, value|
        definition = self.class.definitions[key]
        if definition
          if definition.array?
            properties[key] << definition.property_class.new(definition, value)
          else
            property = properties[key]
            property.content = value
          end
        elsif key =~ /(?<parent>[\w_]+(:[\w_]+)+):(?<property>[\w_]+)/
          parent = Regexp.last_match[:parent]
          definition = self.class.definitions[parent]
          if definition
            property = properties[parent].last
            if property
              reader = Regexp.last_match[:property]
              writer = "#{reader}="
              property.public_send(writer, value) if property.respond_to?(writer)
            else
              properties[parent]
            end
          else
            fail "No Definition for #{parent}"
          end
        else
          fail "No Definition for #{key}"
        end
        # if property.definition.array?
        #   property.last.content = value if property.last
        # else
        #   property.content = value
        # end
        # writer = "#{key}="
        # if self.respond_to?(writer)
        #   public_send(writer, value)
        # end
        # if key =~ /([\w_]+:([\w_]+)):([\w_]+)/
        #   object_name = $2
        #   reader = $3
        #   writer = "#{reader}="
        #   object = public_send(object_name)
        #   unless object.respond_to?(writer)
        #     object.singleton_class.class_eval do
        #       attr_accessor reader
        #     end
        #     # public_send("#{object_name}=", object)
        #   end
        #   # object.public_send(writer, value)
      end
    end

    delegate :const_set, to: 'self.class'

    include PropertiesMethods

    ns :og, 'http://ogp.me/ns#' do
      property :title, required: true
      property :type, required: true
      property :image, required: true, array: true, value: :url do
        property :url
        property :secure_url
        property :type
        property :width, type: Integer
        property :height, type: Integer
      end
      property :url, required: true

      property :audio, value: :url do
        property :url
        property :secure_url
        property :type
      end
      property :description
      property :determiner
      property :locale do
        property :alternate, array: true
      end
      property :site_name
      property :video do
        property :url
        property :secure_url
        property :type
        property :width, type: Integer
        property :height, type: Integer
      end
    end
    ns :fb, 'http://ogp.me/ns/fb#' do
      property :app_id
    end

    # @!group Object Types
    object_type(:music, :song) do
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

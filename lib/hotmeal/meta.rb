require 'hotmeal'
require 'hotmeal/collection_mapper'

module Hotmeal
  class Meta < Hotmeal::CollectionMapper
    self.inspectable_attributes = [:charset, :keywords, :description]

    map '[@charset]/@charset', as: :charset
    collect('[@name and boolean(@content)]', as: :name, use: :content, by: :name)
    collect('[@http-equiv and boolean(@content)]', as: :http_equiv, use: :content, by: :'http-equiv')
    collect('[@property and boolean(@content)]', as: :properties, use: :content, by: :property)

    def properties
      unless @_properties_processed
        @properties = super
        @properties.each do |key, value|
          @properties[key] = value.first
        end
        @_properties_processed = true
      end
      @properties
    end

    # @return [<String>]
    def keywords
      @keywords ||= name['keywords'].flatten.join(', ').split(/\s*,\s*/)
    end

    # @return [String]
    def description
      @description ||= name['description'].flatten.join(' ')
    end
  end
end

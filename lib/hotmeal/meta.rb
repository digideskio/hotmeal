require 'hotmeal'
require 'hotmeal/collection_mapper'

module Hotmeal
  class Meta < Hotmeal::CollectionMapper
    map '[@charset]/@charset', as: :charset

    def process
      collect('[@name and boolean(@content)]', as: :name, use: :content, by: :name)
      collect('[@http-equiv and boolean(@content)]', as: :http_equiv, use: :content, by: :'http-equiv')
      collect('[@property and boolean(@content)]', as: :properties, use: :content, by: :property)
      @properties.each do |key, value|
        @properties[key] = value.first
      end
    end

    # @return [<String>]
    def keywords
      @keywords ||= name['keywords'].flatten.join(', ').split(/\s*,\s*/)
    end

    # @return [String]
    def description
      @keywords ||= name['description'].flatten.join(' ')
    end
  end
end

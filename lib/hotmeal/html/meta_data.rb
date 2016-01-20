require 'hotmeal/html'

module Hotmeal
  module Html
    class MetaData < Hotmeal::Mapper::Collection
      decorate_items_with(Meta)

      attribute '[@charset]/@charset', as: :charset
      elements '[@name and boolean(@content)]', class: Meta, as: :name do
        %w(keywords description).each do |name|
          # elements "[@name='#{name}']/@content", as: name.to_sym
          define_method(name) { select { |meta| meta.name == name }.map(&:content) }
        end
      end
      elements '[@property and boolean(@content)]', class: Meta, as: :property
      elements '[@http-equiv and boolean(@content)]', class: Meta, as: :http_equiv

      def keywords
        name.keywords.compact.join(', ').split(/,\s*/)
      end

      def description
        name.description.compact.join(' ')
      end

      def properties
        property.each_with_object({}) do |meta, result|
          result[meta.property.value] = meta.content
        end
      end
    end
  end
end
require 'hotmeal/open_graph'
require 'hotmeal/mapper/decorator'

module Hotmeal
  class OpenGraph
    class Object < Hotmeal::Mapper::Decorator
      include DSL

      self.namespace = Namespace.og

      def self.decorate(type, html, path)
        decorator = self
        specific_class = (['Hotmeal::OpenGraph'] + type.split(/\./).map(&:classify)).join('::').safe_constantize
        decorator = specific_class if specific_class
        decorator.new(html, path)
      end

      def self.types
        @types ||= {}
      end

      def self.property_class
        @property_class ||= semantic_name.map(&:underscore).join('.')
      end

      def self.semantic_name
        name.gsub(/Hotmeal::OpenGraph::/, '').split('::')
      end

      def self.extended(child)
        super(child)
        Object.types[child.property_class] = child
      end

      ns :og, 'http://ogp.me/ns#' do
        property :title, required: true
        property :type, required: true
        property :image, required: true, array: true, value: :url, as: :images, class: Collection.of(Struct::Image)
        property :url, required: true
        property :audio, value: :url, class: Struct::Audio
        property :description
        property :determiner
        property :locale, class: Struct::Locale
        property :site_name
        property :video, class: Struct::Video
      end

      ns :fb, 'http://ogp.me/ns/fb#' do
        property :app_id
      end

      def image
        images.first
      end
    end
  end
end

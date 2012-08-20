require 'hotmeal'

module Hotmeal
  module OpenGraph
    class GraphObject
      HREF = 'http://ogp.me/ns#'
      BASIC = %w(title type image url).map { |prop| prop.to_sym }
      OPTIONAL = %w(
        description site_name
        determiner locale
        audio video
      ).map { |prop| prop.to_sym }

      class << self
        private
        # @macro [attach] properties
        #   @method $1()
        #   @return [String] OpenGraph $1 property
        def property(name)
          define_method(name) { property(name) }
        end
      end

      def initialize(doc)
        @doc = doc
      end

      # @!group Basic metadata
      property :title
      property :type
      property :image
      property :url

      # @!group Optional metadata
      property :description
      property :site_name
      property :determiner
      property :locale
      property :audio
      property :video

      protected

      attr_reader :doc

      def property(name)
        properties[name]
      end

      def prefix
        @prefix ||= if prefix = @doc.html_prefix.key(HREF)
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

    # @return [GraphObject] OpenGraph object for current document
    def open_graph
      @open_graph ||= GraphObject.new(self)
    end
    alias og open_graph
  end

  class Base
    include OpenGraph
  end
end

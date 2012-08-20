require 'hotmeal'

module Hotmeal
  module Meta
    class MetaData
      def initialize(doc)
        @doc = doc
      end

      # @return [String] given charset
      def charset
        @charset ||= begin
                       charset = doc.at_css('meta[charset]')
                       charset[:charset] || 'utf-8'
                     end
      end

      # @return [Array<String>] keywords
      def keywords
        data[:keywords].split(/,\s*/)
      end

      # @return [String] description
      def description
        data[:description]
      end

      # @return [Hash{Symbol=>String}] map of named metadata
      def data
        @data ||= doc.css('meta[name][content]').inject({}) do |result, node|
          result[node[:name].to_sym] = node[:content]
          result
        end
      end

      # @return [Hash{Symbol=>String}] map of HTTP equiv's
      def http_equiv
        @data ||= doc.css('meta[http-equiv][content]').inject({}) do |result, node|
          result[node[:'http-equiv'].to_sym] = node[:content]
          result
        end
      end

      # @return [Hash{String=>String}] map of properties' name to content
      def properties
        @properties ||= doc.css('meta[property]').inject({}) do |result, node|
          if result[node[:property]]
            result[node[:property]] = [result[node[:property]]] unless result[node[:property]].is_a?(Array)
            result[node[:property]] << node[:content]
          else
            result[node[:property]] = node[:content]
          end
          result
        end
      end

      protected

      attr_reader :doc
    end

    # @return [MetaData] metadata object
    def meta
      @meta ||= MetaData.new(self)
    end
  end

  class Base
    include Meta
  end
end

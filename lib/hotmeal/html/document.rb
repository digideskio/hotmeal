require 'hotmeal/html'
require 'hotmeal/mapper/decorator'

module Hotmeal
  module Html
    class Document < Hotmeal::Html::Html
      # @return [String]
      delegate :title, to: :head
      # @return [Hotmeal::Html::MetaData]
      delegate :meta, to: :head
      # @return [Array<String>] array of keywords
      delegate :keywords, to: :meta
      # @return [String] description
      delegate :description, to: :meta

      def process
        super
        self.base_uri = base_uri if head.base_uri?
      end

      def document_title
        head.title
      end

      def html_prefix
        prefixes = prefix.value.to_s
        prefixes = prefixes.scan(/([^:]+):\s+([^\s]+)\s*/)
        prefixes.each_with_object({}) do |(prefix, href), result|
          result[href] = prefix
        end
      end

      # @return [String]
      def meta_charset
        meta.charset || 'UTF-8'
      end
    end
  end
end

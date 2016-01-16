require 'hotmeal'
require 'hotmeal/element_mapper'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  class Document
    include Hotmeal::ElementMapper

    self.inspectable_attributes += [:document_title, :html_prefix, :meta, :open_graph]
    self.query = '/'

    map '/head/title/text()', as: :document_title
    map 'html[@prefix]/@prefix', as: :html_prefix do |prefix|
      prefix.content.scan(/([\w]+): ([^ ]+)/).each_with_object({}) do |(prefix, href), result|
        result[href] = prefix
      end
    end

    map_each '/meta', as: :meta, class: Hotmeal::Meta
    map_each '/meta[@property and boolean(@content)]', as: :open_graph, class: Hotmeal::OpenGraph
    alias_method :og, :open_graph

    # @return [String] title either from OpenGraph data or from <title> element
    def title
      open_graph.title || document_title
    end

    # @return [Array<String>] array of keywords
    delegate :keywords, to: :meta

    # @return [String] page description either from OpenGraph or MetaData
    def description
      open_graph.description || meta.description
    end

    # @return [Hash]
    def html_prefix
      super || {}
    end

    # @return [String]
    def meta_charset
      meta.charset || 'UTF-8'
    end

    # @return [String] document's inner text
    def inner_text
      at('body').inner_text.to_s.strip
    end

    def body
      Body.new(at('body'))
    end

    # @return [String] document's inner html
    def inner_html
      at('body').inner_html.to_s.strip
    end

    def to_s
      <<-END
head
  title #{document_title}
  meta
    #{indent(meta, 4)}
  open_graph
    #{indent(open_graph, 4)}
#{body}
      END
    end
  end
end
require 'hotmeal/meta'
require 'hotmeal/open_graph'

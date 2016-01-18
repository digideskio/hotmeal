require 'hotmeal'
require 'hotmeal/element_mapper'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  class Document < Hotmeal::Html::Document
    include Hotmeal::ElementMapper

    self.inspectable_attributes += [:document_title, :html_prefix, :meta, :open_graph]
    self.query = '/'

    def initialize(html, base_uri = nil)
      super(html)
      self.url = base_uri || self.base_uri if base_uri || self.base_uri.present?
    end

    delegate :base_uri, to: :head

    def base_uri=(uri)
      head.base_uri = uri
      self.url = uri
    end

    # @return [URI::Generic]
    attr_reader :url

    def url=(uri)
      uri = URI(uri.to_s) unless uri.is_a?(URI::Generic)
      search('[@href]/@href, form[@action]/@action, img[@src]/@src').each do |node|
        node.content = (uri + URI(node.content)).to_s if node.respond_to?(:content=)
      end
      @url = uri
    end

    map_each '/meta[@property and boolean(@content)]', as: :open_graph, class: Hotmeal::OpenGraph

    # @return [String] title either from OpenGraph data or from <title> element
    def title
      open_graph.title.presence || super
    end

    # @return [String] page description either from OpenGraph or MetaData
    def description
      open_graph.description.presence || meta.description
    end

    def to_s
      <<-END
head
  title #{document_title}
  meta
    #{indent(meta, 4)}
  open_graph
    #{indent(open_graph, 4)}
  links
    #{indent(links, 4)}
#{body}
      END
    end
  end
end
require 'hotmeal/open_graph'

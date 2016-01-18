require 'hotmeal'
require 'hotmeal/element_mapper'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  class Document < Hotmeal::Html::Document
    include Hotmeal::ElementMapper

    self.inspectable_attributes += [:document_title, :html_prefix, :meta, :open_graph]
    self.query = '/'

    def initialize(html = nil, base_uri = nil)
      super(html)
      self.url = base_uri
      # uri = head.base_uri
      # uri = uri.__getobj__ while uri.respond_to?(:__getobj__)
      # self.url = uri if uri
    end

    alias_method :charset, :meta_charset

    # @return [URI::Generic]
    attr_reader :url

    def url=(uri)
      return unless uri.is_a?(URI::Generic)
      if uri
        puts uri.class
        puts uri.inspect
        uri = URI(uri)
        search('a[@href]/@href, link[@href]/@href, form[@action]/@action, img[@src]/@src').each do |node|
          node.content = (uri + URI(node.content)).to_s if node.respond_to?(:content=)
        end
      end
      @url = uri ? URI(uri.to_s) : nil
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
    #{indent(head.links, 4)}
#{body}
      END
    end
  end
end
require 'hotmeal/open_graph'

require 'hotmeal'
require 'hotmeal/document'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  class Base < Document
    attr_reader :html

    # @return [String] document's inner text
    def inner_text
      at_css('body').inner_text.to_s.strip
    end

    # @return [String] document's inner html
    def inner_html
      at_css('body').inner_html.to_s.strip
    end

    # @return [String] title either from OpenGraph data or from <title> element
    def title
      og.title || document_title
    end

    # @return [Array<String>] array of keywords
    delegate :keywords, to: :meta

    # @return [String] page description either from OpenGraph or MetaData
    def description
      og.description || meta.description
    end
  end
end

require 'hotmeal/meta'
require 'hotmeal/open_graph'

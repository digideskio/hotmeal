require 'nokogiri'

module Hotmeal
  class Base
    attr_reader :html

    def initialize(html)
      html = Nokogiri::HTML(html) unless html.is_a?(Nokogiri::XML::Node)
      @html = html
    end

    # @return [String] document title from html>head>title element
    def html_title
      @html_title ||= at_css('head title').content.to_s
    end

    # @return [Hash{}]
    def html_prefix
      unless @html_prefix
        prefixes = at_css('html')[:prefix]
        @html_prefix = if prefixes
                         match_data = prefixes.scan(/([\w]+): ([^\ ]+)/).inject({}) do |result, (prefix, href)|
                           result[href] = prefix
                           result
                         end
                       else
                         {}
                       end
       end
      @html_prefix
    end

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
      og.title || html_title
    end

    # @return [Array<String>] array of keywords
    delegate :keywords, to: :meta

    # @return [String] page description either from OpenGrpah or MetaData
    def description
      og.description || meta.description
    end

    # @param path [String] css path
    # @return [Nokogiri::XML::Node] html node at given css path
    delegate :at_css, to: :html

    # @param path [String] css path
    # @return [Array<Nokogiri::XML::Node>] html node at given css path
    delegate :css, to: :html
  end
end

require 'hotmeal/meta'
require 'hotmeal/open_graph'

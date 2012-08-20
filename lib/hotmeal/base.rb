require 'nokogiri'
require 'hotmeal/meta'

module Hotmeal
  class Base
    attr_reader :html

    include Meta

    def initialize(html)
      html = Nokogiri::HTML(html) unless html.is_a?(Nokogiri::XML::Node)
      @html = html
    end

    def html_title
      @html_title ||= at_css('head title').content.to_s
    end

    def inner_text
      at_css('body').inner_text.to_s.strip
    end

    def inner_html
      at_css('body').inner_html.to_s.strip
    end

    def title
      html_title
    end

    protected

    def at_css(path)
      html.at_css(path)
    end

    def css(path)
      html.css(path)
    end
  end
end

require 'nokogiri'

module Hotmeal
  class Base
    attr_reader :html

    def initialize(html)
      html = Nokogiri::HTML(html) unless html.is_a?(Nokogiri::XML::Node)
      @html = html
    end

    def html_title
      @html_title ||= at_css('head title').content.to_s
    end

    def html_meta
      @html_meta ||= css('meta[content]').inject({}) do |result, meta|
        result[(meta[:name] || meta[:'http-equiv']).to_sym] = meta[:content].to_s
        result
      end
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

    def keywords
      html_meta[:keywords].split(/,\s*/)
    end

    def description
      html_meta[:description]
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

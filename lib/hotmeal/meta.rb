module Hotmeal
  module Meta
    def html_charset
      @html_charset ||= begin
                     meta = at_css('meta[charset]')
                     meta[:charset] || 'utf-8'
                   end
    end

    def html_meta
      @html_meta ||= css('meta[content]').inject({}) do |result, meta|
        result[(meta[:name] || meta[:'http-equiv']).to_sym] = meta[:content].to_s
        result
      end
    end

    def keywords
      html_meta[:keywords].split(/,\s*/)
    end

    def description
      html_meta[:description]
    end
  end
end

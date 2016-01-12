require 'hotmeal'
require 'hotmeal/element_mapper'
require 'active_support/core_ext/class/attribute'

module Hotmeal
  class Document
    include Hotmeal::ElementMapper

    self.query = '/'

    def initialize(html)
      self.html = html
    end

    map '/head/title/text()', as: :document_title

    map 'html[@prefix]/@prefix', as: :html_prefix do |prefix|
      prefix.content.scan(/([\w]+): ([^ ]+)/).each_with_object({}) do |(prefix, href), result|
        result[href] = prefix
      end
    end

    map_each '/meta', as: :meta, class: Hotmeal::Meta

    def title
      document_title
    end

    def html_prefix
      super || {}
    end

    def meta_charset
      meta.charset
    end
  end
end

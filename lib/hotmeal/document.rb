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

    map '/head/title', as: :document_title

    map 'html[@prefix]/@prefix', as: :html_prefix do |content|
      content.scan(/([\w]+): ([^ ]+)/).each_with_object({}) do |(prefix, href), result|
        result[href] = prefix
      end
    end

    def html_prefix
      super || {}
    end

    map_each '/meta', as: :meta, class: Hotmeal::Meta::Meta

    def meta_charset
      meta.charset
    end

    def title
      document_title
    end
  end
end

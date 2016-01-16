require 'hotmeal'
require 'hotmeal/element_mapper'
require 'hotmeal/body/slim_representation'

module Hotmeal
  class Body
    include Hotmeal::ElementMapper

    INVISIBLE_ELEMENTS = %w(script style noscript)
    INVISIBLE_ATTRIBUTES = %w(
        [@onclick]/@onclick [@style]/@style [@onload]/@onload [@nowrap]/@nowrap
    )
    WRAPPERS = %w(nobr)

    def to_s
      body = html
      (INVISIBLE_ELEMENTS + INVISIBLE_ATTRIBUTES).each do |query|
        body.search(query).each { |node| node.remove }
      end
      WRAPPERS.each do |query|
        body.search(query).each do |node|
          node.replace(node.children)
          # node.after(node.children)
          # node.remove
        end
      end
      body.search('text()') { |text| text.remove if text.content.empty? }
      body.extend(SlimRepresentation)
      body.to_s
    end
  end
end

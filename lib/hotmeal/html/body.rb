require 'hotmeal/html'

module Hotmeal
  module Html
    class Body < Hotmeal::Mapper::Decorator
      INVISIBLE_ELEMENTS = %w(script style noscript)
      INVISIBLE_ATTRIBUTES = %w(
        [@onclick]/@onclick [@style]/@style [@onload]/@onload [@nowrap]/@nowrap
      )
      WRAPPERS = %w(div span nobr)

      def to_s
        body = html.dup
        (INVISIBLE_ELEMENTS + INVISIBLE_ATTRIBUTES).each do |query|
          body.search(query).each { |node| node.remove }
        end
        WRAPPERS.each do |query|
          body.search(query).each do |node|
            node.after(node.children)
            node.remove
          end
        end
        2.times do
          body.search('text()') do |text|
            following = text.next
            if text.content.empty?
              text.remove
            elsif following.is_a?(Nokogiri::XML::Text)
              text.content += following.content
              following.remove
            end
          end
        end
        body.extend(SlimRepresentation)
        body.to_s
      end
    end
  end
end

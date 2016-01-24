require 'hotmeal/html'

module Hotmeal
  module Html
    class Body < Hotmeal::Mapper::Decorator
      INVISIBLE_ELEMENTS = %w(script style noscript)
      INVISIBLE_ATTRIBUTES = %w(onclick style onload nowrap width)
      INVISIBLE_ATTRIBUTES_QUERY = '@' + INVISIBLE_ATTRIBUTES.join(',@')

      WRAPPERS = %w(div span nobr center)

      elements '//a', class: Hotmeal::Html::A, as: :links

      register_scrubber :remove_wrappers do |node|
        node.replace(node.children) if WRAPPERS.include?(node.name)
      end
      register_scrubber(:collect_text) do |node|
        node.search('text()') do |text|
          following = text.next
          if text.content.empty?
            text.remove
          elsif following.is_a?(Nokogiri::XML::Text)
            text.content += " #{following.content}"
            following.remove
          end
          text.content = text.content.gsub(/\s+/, ' ').strip.presence
        end
      end
      register_scrubber :remove_visuals do |node|
        node.remove if INVISIBLE_ELEMENTS.include?(node.name)
        node.search(INVISIBLE_ATTRIBUTES_QUERY).each { |node| node.remove }
      end
      register_preset :default, :remove_visuals, :strip, :remove_wrappers, :collect_text

      def to_s
        body = scrub
        Slim.decorate(body).to_slim
      end
    end
  end
end

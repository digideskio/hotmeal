require 'hotmeal'
require 'hotmeal/element_mapper'

module Hotmeal
  class Body
    include Hotmeal::ElementMapper

    # self.inspectable_attributes = []

    module SlimRepresentation
      def to_s
        case self
        when Nokogiri::XML::Element
          string = "#{[element, id, classes, role].compact.join}#{attributes}"
          if children.size > 1
            "#{string}\n#{indent(inspect_children)}"
          elsif children.size == 1
            if children.first.is_a?(Nokogiri::XML::Element)
              "#{string}: #{inspect_children}"
            else
              "#{string} #{content}"
            end
          else
            string
          end
        when Nokogiri::XML::Text
          "| #{content}" if content.present?
        else
          nil
        end
      end

      def element
        name == 'div' ? nil : name
      end

      def id
        self[:id].present? ? "##{self[:id]}" : nil
      end

      def classes
        classes = self[:class].to_s.split(/\s+/).join('.')
        ".#{classes}" if classes.present?
      end

      def role
        self[:role].present? ? "@#{self[:role]}" : nil
      end

      def attributes
        attributes = keys.map do |attribute|
          "#{attribute}=#{self[attribute].inspect}" unless %w(id class role).include?(attribute)
        end.compact.join(' ')
        " #{attributes}" if attributes.present?
      end

      def inspect_children
        children.map do |child|
          child.extend(SlimRepresentation)
          child.to_s
        end.compact.join("\n")
      end

      def indent(text, blank = 2)
        indentation = ' ' * blank
        indentation << text.to_s.split(/\n/).join("\n" << indentation)
      end
    end

    def to_s
      body = html
      %w(script style noscript [@onclick]/@onclick [@style]/@style).each do |query|
        body.search(query).each { |node| node.remove }
      end
      %w(nobr).each do |query|
        body.search(query).each do |node|
          node.after(node.children)
          node.remove
        end
      end
      body.search('text()') do |text|
        text.remove if text.content.empty?
      end
      body.extend(SlimRepresentation)
      body.to_s
    end
  end
end

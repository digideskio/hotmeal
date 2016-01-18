require 'hotmeal/html'
require 'nokogiri'

module Hotmeal
  module Html
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
        if name == 'div' then
          if id? || html_classes.any? || role?
            nil
          else
            'div'
          end
        else
          name
        end
      end

      def id
        id? ? "##{self[:id]}" : nil
      end

      def id?
        self[:id].present?
      end

      def classes
        classes = html_classes.join('.')
        ".#{classes}" if classes.present?
        nil
      end

      def html_classes
        self[:class].to_s.split(/\s+/)
      end

      def role
        role? ? "@#{self[:role]}" : nil
      end

      def role?
        self[:role].present?
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
  end
end

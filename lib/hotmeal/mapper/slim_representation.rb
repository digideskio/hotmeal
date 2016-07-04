require 'hotmeal/html'
require 'nokogiri'

module Hotmeal
  module Mapper
    module SlimRepresentation
      class Slim < SimpleDelegator
        HIDDEN_ATTRIBUTES = %i(align bgcolor cellpadding cellspasing clear width)

        @@mappings = {
          id: ->(element) { "##{element[:id]}" },
          class: ->(element) { '.' + element.classes.join('.') },
          role: ->(element) { "@#{element[:role]}" }
        }

        def self.decorate(node)
          new(node)
        end

        def classes
          return unless xml?
          @classes ||= __getobj__[:class].to_s.split(/\s+/)
        end

        def to_slim(options = {})
          case __getobj__
          when Nokogiri::XML::Text
            return unless text_content.present?
            if single?
              text_content
            else
              "| #{text_content}"
            end
          else
            [definition, attributes].compact.join(' ') + contents.to_s
          end
        end

        def single?
          !self.next && !self.previous
        end

        private

        def text_content
          self.inner_text if self.inner_text.present?
        end

        def definition
          [element_name, aliased_attributes].compact.join.presence
        end

        def element_name
          name if respond_to?(:name) && element_name_visible?
        end

        def element_name_visible?
          if xml?
            name != 'div' || aliased_attributes_present?
          else
            false
          end
        end

        def aliased_attributes
          return unless xml?
          @aliased_attributes ||= @@mappings.map do |(attribute, mapping)|
            mapping.call(self) if __getobj__[attribute]
          end.compact.join.presence
        end

        def xml?
          __getobj__.is_a?(Nokogiri::XML::Node)
        end

        def aliased_attributes_present?
          aliased_attributes.present?
        end

        def visible_attributes
          @visible_attributes ||= keys - @@mappings.keys.map(&:to_s) - HIDDEN_ATTRIBUTES
        end

        def attributes
          attributes = visible_attributes.map do |name|
            "#{name}=#{self[name].inspect}"
          end.join(' ')
          attributes.presence
        end

        def hidden_attribute?(name)
          name = name.to_sym
          @@mappings.keys.include?(name) || HIDDEN_ATTRIBUTES.include?(name)
        end

        def contents
          return unless xml?
          children = decorated_children.map(&:to_slim).compact
          return '' unless children.any?
          if children.size == 1
            child = children.first
            if decorated_children.first.is_a?(Nokogiri::XML::Text)
              child.to_s
            elsif child.present?
              ': ' + child
            end
          else
            indent(children.join("\n"))
          end
        end

        def indent(text, indentation = ' ')
          text.to_s.split("\n").map { |line| "\n#{indentation}#{line}" }.join
        end

        def decorated_children
          __getobj__.children.map { |child| Slim.decorate(child) }
        end
      end

      def to_slim
        @slim ||= Slim.decorate(self).to_slim
      end

      alias_method :to_s, :to_slim
    end
  end
end

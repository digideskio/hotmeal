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
          role: ->(element) { "@#{element[:role]}" + element.classes.join('.') }
        }

        def self.decorate(node)
          new(node)
        end

        def classes
          @classes ||= self[:class].to_s.split(/\s+/)
        end

        def to_slim(options = {})
          case __getobj__
          when Nokogiri::XML::Text
            return unless text_content.present?
            if self.next || self.previous
              "| #{text_content}" if text_content.present?
            else
              text_content
            end
          else
            [options[:prefix], definition, attributes, contents].compact.join(' ')
          end
        end

        private

        def text_content
          self.inner_text if self.inner_text.present?
        end

        def definition
          [element_name, aliased_attributes].compact.join
        end

        def element_name
          name if element_name_visible?
        end

        def element_name_visible?
          name != 'div' || aliased_attributes_present?
        end

        def aliased_attributes
          @aliased_attributes ||= @@mappings.map do |(attribute, mapping)|
            mapping.call(self) if self[attribute]
          end.compact.join
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
          attributes
        end

        def hidden_attribute?(name)
          name = name.to_sym
          @@mappings.keys.include?(name) || HIDDEN_ATTRIBUTES.include?(name)
        end

        def contents
          children = decorated_children
          if children.size == 1
            children.first.to_slim(prefix: ':')
          elsif children.size == 0
            nil
          else
            indent(children.map(&:to_slim).compact.join("\n"))
          end
        end

        def indent(text, indentation = ' ')
          text.to_s.split("\n").map do |line|
            "\n#{indentation}#{line}"
          end.join
        end

        def decorated_children
          children.map do |child|
            Slim.decorate(child)
          end
        end
      end

      def to_slim
        @slim ||= Slim.decorate(self).to_slim
      end

      alias_method :to_s, :to_slim
    end
  end
end

require 'hotmeal'
require 'hotmeal/collection_mapper'

module Hotmeal
  class Links < Hotmeal::CollectionMapper
    include Enumerable
    self.inspectable_attributes = [:self, :alternate, :search, :icon, :others]

    collect('[@rel and boolean(@href)]', as: :links, use: ->(node) { Link.create(node) })

    delegate :each, :size, :last, to: :links

    KNOWN_RELATIONS = %w(self alternate search icon)

    KNOWN_RELATIONS.each do |relation|
      define_reader(relation) do
        self.links.reject do |link|
          related = link.rel?(relation)
          link.inspectable_attributes -= [:rel] if related
          !related
        end
      end
    end

    def others
      @others ||= links.reject { |link| link.rel?(*KNOWN_RELATIONS) }
    end

    def to_s
      (KNOWN_RELATIONS + ['others']).map do |relation|
        links = public_send(relation)
        if links.any?
          "#{relation}:\n  #{indent(links.map(&:to_s).join("\n"))}"
        end
      end.compact.join("\n")
    end

    class Link < Struct.new(:rel, :href, :type, :hreflang, :media, :sizes)
      include Hotmeal::Inspectable

      self.inspectable_attributes = [:rel, :href, :type, :hreflang, :media, :sizes]
      self.attribute_glue = '='
      self.attributes_glue = ' '

      # @param [Nokogiri::XML::Node] node
      def self.create(node)
        new(node[:rel], node[:href], node[:type], node[:hreflang], node[:media], node[:sizes])
      end

      def rels
        @rels ||= rel.to_s.split(/\s+/)
      end

      def rel?(*others)
        others.any? do |other|
          rels.any? { rel == other }
        end
      end

      def url
        URI(href)
      end
    end
  end
end

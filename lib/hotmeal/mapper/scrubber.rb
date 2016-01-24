require 'hotmeal/mapper'
require 'loofah'

module Hotmeal
  module Mapper
    module Scrubber
      extend ActiveSupport::Concern
      include Html

      included do
        class_attribute :scrubbers
        self.scrubbers = {}

        class_attribute :presets
        self.presets = Hash.new { |hash, name| hash[name] = [] }

        class_attribute :built_presets
        self.built_presets = {}
      end

      def scrub!(preset_name = :default)
        loofah = Loofah.fragment(html.to_html)

        scrubbers = self.class.preset(preset_name)
        scrubbers.each do |scrubber|
          loofah = loofah.scrub!(scrubber)
        end

        self.html = loofah.serialize_root
      end

      def scrub(preset_name = :default)
        dup.scrub!(preset_name)
      end

      module ClassMethods
        def preset(name)
          presets[name].map { |scrubber| scrubbers[scrubber.to_sym] || scrubber }
        end

        def register_scrubber(name, &block)
          scrubbers[name] = Loofah::Scrubber.new(&block)
        end

        def register_preset(name, *scrubbers)
          presets[name] = scrubbers
        end
      end
    end
  end
end

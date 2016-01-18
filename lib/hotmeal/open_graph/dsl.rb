require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    module DSL
      def ns(name, uri = nil, &block)
        if block.arity == 1
          with_options(ns: name, uri: uri, &block)
        else
          with_options(ns: name, uri: uri) { |wo| wo.instance_eval(&block) }
        end
      end

      # @example
      #   property :title, required: true, ns: :og
      #
      #   is equivalent to
      #
      #   attribute "[@property='og:title']/@content", as: property, class: Property
      def property(name, options = {}, &block)
        property = [options[:ns], name].join(':')
        options.delete(:array)
        attribute "[@property='#{property}']/@content", {as: name, class: Property}.merge(options)
      end
    end
  end
end

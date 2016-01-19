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
        attribute "[@property='#{property}']/@content", { as: name, class: Property }.merge(options)
      end

      def object_type(ns, name = nil, options = {}, &block)
        options[:url] ||= "http://ogp.me/ns/#{ns}#"
        ns_checker = "#{ns}?"
        reader = [ns, name].compact.join('_')
        checker = reader + '?'
        type = [ns, name].compact.join('.')
        prefix = [ns, name].compact.join(':')
        define_method(ns_checker) { !!(self.type =~ /^#{ns}/) } unless instance_methods.include?(ns_checker)
        define_method(checker) { self.type == type } unless instance_methods.include?(checker)
        ns(ns, options[:url], &block) if block_given?
        attribute "[@property='#{prefix}']/@content", { as: reader, class: Property }.merge(options)
      end
    end
  end
end
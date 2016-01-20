require 'hotmeal/open_graph'
require 'active_support/core_ext/object/with_options'

module Hotmeal
  class OpenGraph
    module DSL
      extend ActiveSupport::Concern

      included do
        class_attribute :namespace
      end

      module ClassMethods
        def prefix
          namespace.prefix if namespace
        end

        def ns(name, uri, &block)
          # prefix = Namespace.for(uri)
          # self.namespace = prefix
          if block.arity == 1
            with_options(ns: name, uri: uri, &block)
          else
            with_options(ns: name, uri: uri) { |wo| wo.instance_eval(&block) }
          end
        end

        def default_options
          namespace ? namespace.to_hash : {}
        end

        # @example
        #   property :title, required: true, ns: :og
        #
        #   is equivalent to
        #
        #   attribute "[@property='og:title']/@content", as: property, class: Property
        def property(name, options = {}, &block)
          property = [options[:ns], name].join(':')
          path = name.is_a?(Symbol) ? "[@property='#{property}']/@content" : name
          options.delete(:array)
          attribute path, { as: name, class: Property }.merge(default_options).merge(options)
        end

        def struct(name, options = {}, &block)
          property = [options[:ns], name].join(':')
          path = "[starts-with(@property, '#{property}')]/@content"
          property(path, {as: name}.merge(options), &block)
        end

        def object_type(ns, name = nil, options = {}, &block)
          if name.is_a?(Hash)
            options = name
            name = nil
          end
          options[:uri] ||= "http://ogp.me/ns/#{ns}#"
          ns_checker = "#{ns}?"
          reader = [ns, name].compact.join('_')
          checker = reader + '?'
          type = [ns, name].compact.join('.')
          define_method(ns_checker) { !!(self.type =~ /^#{ns}/) } unless instance_methods.include?(ns_checker)
          define_method(checker) { self.type == type } unless instance_methods.include?(checker)
          ns(ns, options[:url]) {}
          attribute "[starts-with(@property, '#{ns}:')]/@content", { as: (name || reader).to_sym, class: Property }.merge(options)
        end

        def attribute(*args, &block)
          # Kernel.puts args.inspect
          super(*args, &block)
        end
      end
    end
  end
end

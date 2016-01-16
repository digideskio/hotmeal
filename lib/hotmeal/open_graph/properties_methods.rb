require 'hotmeal/open_graph'

module Hotmeal
  class OpenGraph
    module PropertiesMethods
      def ns(name, uri = nil, &block)
        if block.arity == 1
          with_options({ ns: name, uri: uri }, &block)
        else
          with_options(ns: name, uri: uri) do |wo|
            wo.instance_eval(&block)
          end
        end
      end

      # @macro [attach] properties
      #   @method $1()
      #   @return [String] OpenGraph $1 property
      def property(name, options = {}, &block)
        options ||= {}
        if options[:ns]
          method = "#{options[:ns]}_#{name}".gsub(/:/, '_')
        else
          method = name
        end
        self.inspectable_attributes << method
        options[:ns] = 'og' unless options.key?(:ns)
        property = Property.new("#{options[:ns]}:#{name}", options)
        map("[@property='#{options[:ns]}:#{name}']/@content", as: method) if respond_to?(:map)
        property.ns!([options[:ns], name].compact.join(':'), &block) if block_given?
      end

      # @macro [attach] object_types
      #   @method $1?()
      #   @return [Boolean] is graph object $1?
      def object_type(ns, name = nil, &block)
        if name
          ns_check = "#{ns}?"
          method = "#{ns}_#{name}?"
          type = "#{ns}.#{name}"
        else
          name = ns
          ns = nil
          method = "#{name}?"
          type = name
        end
        if ns && !instance_methods.include?(ns_check)
          define_method(ns_check) { self.type =~ /^#{ns}/ }
        end
        define_method(method) { self.type == type }
        ns(ns || name, &block) if block_given?
      end
    end
  end
end

require 'hotmeal'
require 'active_support/concern'
require 'active_support/core_ext/module/delegation'

module Hotmeal
  module MethodsModule
    extend ActiveSupport::Concern

    included do
      include const_set(:OverridableMethodsModule, Module.new) unless const_defined?(:OverridableMethodsModule)
    end

    module ClassMethods
      delegate :attr_reader, :attr_writer, :attr_accessor, to: :methods_module

      def define_method(method, &block)
        methods_module.send(:define_method, method, &block)
      end

      def attr_reader(*args)
        self.inspectable_attributes += args
        methods_module.send(:attr_reader, *args)
      end

      def attr_writer(*args)
        methods_module.send(:attr_writer, *args)
      end

      def attr_accessor(*args)
        methods_module.send(:attr_accessor, *args)
      end

      def define_reader(name, &block)
        instance_variable = "@#{name}"
        define_method(name) do
          instance_variable_get(instance_variable) ||
            instance_variable_set(instance_variable, instance_eval(&block))
        end
      end

      def define_writer(name, &block)
        instance_variable = "@#{name}"
        define_method("#{name}=") do |value|
          remove_instance_variable(instance_variable)
          instance_exec(value, &block)
        end
      end

      # @return [Module]
      def methods_module
        const_get(:OverridableMethodsModule)
      end
    end
  end
end

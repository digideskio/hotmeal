require 'hotmeal/mapper'
require 'hotmeal/mapper/attributes'
require 'rdf/microdata'

module Hotmeal
  module Mapper
    module Microdata
      extend ActiveSupport::Concern
      include Mapper::Attributes

      included do
        class_attribute :microdata_properties
        self.microdata_properties = {}
      end

      def microdata_graphs
        @microdata_graphs ||= {}
      end

      def read_microdata(query)
        microdata_graphs[query] ||= RDF::Microdata::Reader.new(search(query).to_html).expand
      end

      module ClassMethods
        def inherited(child)
          child.microdata_properties = microdata_properties
        end

        def microdata(name = :microdata, query = '.')
          microdata_properties[name] = query

          generated_attribute_methods.module_eval do
            define_method(name) { read_microdata(query) }
          end
        end
      end
    end
  end
end

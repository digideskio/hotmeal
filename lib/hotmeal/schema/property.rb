# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/thing'

module Hotmeal
  module Schema
    # Property
    #
    # @see http://schema.org/Property
    class Property < Thing
      # Relates a property to a class that is (one of) the type(s) the property is expected to be used on.
      property :domain_includes, class_name: 'Class', as: 'domainIncludes', label: 'Domain Includes'
      # Relates a property to a class that constitutes (one of) the expected type(s) for values of the property.
      property :range_includes, class_name: 'Class', as: 'rangeIncludes', label: 'Range Includes'
    end
  end
end

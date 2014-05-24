# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/product'

module Hotmeal
  module Schema
    # Some Products
    #
    # @see http://schema.org/SomeProducts
    class SomeProducts < Product
      # The current approximate inventory level for the item or items.
      property :inventory_level, class_name: 'QuantitativeValue', as: 'inventoryLevel', label: 'Inventory Level'
    end
  end
end


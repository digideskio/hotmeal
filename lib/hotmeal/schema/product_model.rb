# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Product Model
    #
    # A datasheet or vendor specification of a product (in the sense of a prototypical description).
    # @see http://schema.org/ProductModel
    class ProductModel < Product
      # A pointer to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive.
      property :is_variant_of, class_name: 'ProductModel', as: 'isVariantOf', label: 'Is Variant of'
      # A pointer from a previous, often discontinued variant of the product to its newer variant.
      property :predecessor_of, class_name: 'ProductModel', as: 'predecessorOf', label: 'Predecessor of'
      # A pointer from a newer variant of a product  to its previous, often discontinued predecessor.
      property :successor_of, class_name: 'ProductModel', as: 'successorOf', label: 'Successor of'
    end
  end
end

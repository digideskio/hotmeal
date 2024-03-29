# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/structured_value'

module Hotmeal
  module Schema
    # Price Specification
    #
    # @see http://schema.org/PriceSpecification
    #
    # Subtypes:
    # @see DeliveryChargeSpecification
    # @see PaymentChargeSpecification
    # @see UnitPriceSpecification
    class PriceSpecification < StructuredValue
      # The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
      property :eligible_quantity, class_name: 'QuantitativeValue', as: 'eligibleQuantity', label: 'Eligible Quantity'
      # The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
      property :eligible_transaction_volume, class_name: 'PriceSpecification', as: 'eligibleTransactionVolume', label: 'Eligible Transaction Volume'
      # The highest price if the price is a range.
      property :max_price, class_name: 'Number', as: 'maxPrice', label: 'Max Price'
      # The lowest price if the price is a range.
      property :min_price, class_name: 'Number', as: 'minPrice', label: 'Min Price'
      # The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.
      property :price, class_names: %w(Text Number), as: 'price', label: 'Price'
      # The currency (in 3-letter ISO 4217 format) of the offer price or a price component, when attached to PriceSpecification and its subtypes.
      property :price_currency, class_name: 'Text', as: 'priceCurrency', label: 'Price Currency'
      # The date when the item becomes valid.
      property :valid_from, class_name: 'DateTime', as: 'validFrom', label: 'Valid From'
      # The end of the validity of offer, price specification, or opening hours data.
      property :valid_through, class_name: 'DateTime', as: 'validThrough', label: 'Valid Through'
      # Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.
      property :value_added_tax_included, class_name: 'Boolean', as: 'valueAddedTaxIncluded', label: 'Value Added Tax Included'
    end
  end
end

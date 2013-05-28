# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Delivery Charge Specification
    #
    # The price for the delivery of an offer using a particular delivery method.
    # @see http://schema.org/DeliveryChargeSpecification
    class DeliveryChargeSpecification < PriceSpecification
      # The delivery method(s) to which the delivery charge or payment charge specification applies.
      property :applies_to_delivery_method, class_name: 'DeliveryMethod', as: 'appliesToDeliveryMethod', label: 'Applies to Delivery Method'
      # The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.
      property :eligible_region, class_names: %w[Text GeoShape], as: 'eligibleRegion', label: 'Eligible Region'
    end
  end
end


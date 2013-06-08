# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/price_specification'

module Hotmeal
  module Schema
    # Payment Charge Specification
    #
    # The costs of settling the payment using a particular payment method.
    # @see http://schema.org/PaymentChargeSpecification
    class PaymentChargeSpecification < PriceSpecification
      # The delivery method(s) to which the delivery charge or payment charge specification applies.
      property :applies_to_delivery_method, class_name: 'DeliveryMethod', as: 'appliesToDeliveryMethod', label: 'Applies to Delivery Method'
      # The payment method(s) to which the payment charge specification applies.
      property :applies_to_payment_method, class_name: 'PaymentMethod', as: 'appliesToPaymentMethod', label: 'Applies to Payment Method'
    end
  end
end


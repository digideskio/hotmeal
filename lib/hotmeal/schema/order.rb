# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/intangible'

module Hotmeal
  module Schema
    # Order
    #
    # @see http://schema.org/Order
    class Order < Intangible
      # The offer(s) -- e.g., product, quantity and price combinations -- included in the order.
      property :accepted_offer, class_name: 'Offer', as: 'acceptedOffer', label: 'Accepted Offer'
      # The billing address for the order.
      property :billing_address, class_name: 'PostalAddress', as: 'billingAddress', label: 'Billing Address'
      # A number that confirms the given order.
      property :confirmation_number, class_name: 'Text', as: 'confirmationNumber', label: 'Confirmation Number'
      # Party placing the order.
      property :customer, class_names: %w(Organization Person), as: 'customer', label: 'Customer'
      # Any discount applied (to an Order).
      property :discount, class_names: %w(Number Text), as: 'discount', label: 'Discount'
      # Code used to redeem a discount.
      property :discount_code, class_name: 'Text', as: 'discountCode', label: 'Discount Code'
      # The currency (in 3-letter ISO 4217 format) of the discount.
      property :discount_currency, class_name: 'Text', as: 'discountCurrency', label: 'Discount Currency'
      # Was the offer accepted as a gift for someone other than the buyer.
      property :is_gift, class_name: 'Boolean', as: 'isGift', label: 'Is Gift'
      # The party taking the order (e.g. Amazon.com is a merchant for many sellers).
      property :merchant, class_names: %w(Organization Person), as: 'merchant', label: 'Merchant'
      # Date order was placed.
      property :order_date, class_name: 'DateTime', as: 'orderDate', label: 'Order Date'
      # The item ordered.
      property :ordered_item, class_name: 'Product', as: 'orderedItem', label: 'Ordered Item'
      # The identifier of the transaction.
      property :order_number, class_name: 'Text', as: 'orderNumber', label: 'Order Number'
      # The current status of the order.
      property :order_status, class_name: 'OrderStatus', as: 'orderStatus', label: 'Order Status'
      # The date that payment is due.
      property :payment_due, class_name: 'DateTime', as: 'paymentDue', label: 'Payment Due'
      # The name of the credit card or other method of payment for the order.
      property :payment_method, class_name: 'PaymentMethod', as: 'paymentMethod', label: 'Payment Method'
      # An identifier for the method of payment used (e.g. the last 4 digits of the credit card).
      property :payment_method_id, class_name: 'Text', as: 'paymentMethodId', label: 'Payment Method Id'
      # The URL for sending a payment.
      property :payment_url, class_name: 'URL', as: 'paymentUrl', label: 'Payment Url'
    end
  end
end

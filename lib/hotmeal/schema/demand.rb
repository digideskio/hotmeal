# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Demand
    #
    # A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.
    # @see http://schema.org/Demand
    class Demand < Intangible
      # The payment method(s) accepted by seller for this offer.
      property :accepted_payment_method, class_name: 'PaymentMethod', as: 'acceptedPaymentMethod', label: 'Accepted Payment Method'
      # The amount of time that is required between accepting the offer and the actual usage of the resource or service.
      property :advance_booking_requirement, class_name: 'QuantitativeValue', as: 'advanceBookingRequirement', label: 'Advance Booking Requirement'
      # The availability of this item—for example In stock, Out of stock, Pre-order, etc.
      property :availability, class_name: 'ItemAvailability', as: 'availability', label: 'Availability'
      # The end of the availability of the product or service included in the offer.
      property :availability_ends, class_name: 'DateTime', as: 'availabilityEnds', label: 'Availability Ends'
      # The beginning of the availability of the product or service included in the offer.
      property :availability_starts, class_name: 'DateTime', as: 'availabilityStarts', label: 'Availability Starts'
      # The place(s) from which the offer can be obtained (e.g. store locations).
      property :available_at_or_from, class_name: 'Place', as: 'availableAtOrFrom', label: 'Available At or From'
      # The delivery method(s) available for this offer.
      property :available_delivery_method, class_name: 'DeliveryMethod', as: 'availableDeliveryMethod', label: 'Available Delivery Method'
      # The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
      property :business_function, class_name: 'BusinessFunction', as: 'businessFunction', label: 'Business Function'
      # The typical delay between the receipt of the order and the goods leaving the warehouse.
      property :delivery_lead_time, class_name: 'QuantitativeValue', as: 'deliveryLeadTime', label: 'Delivery Lead Time'
      # The type(s) of customers for which the given offer is valid.
      property :eligible_customer_type, class_name: 'BusinessEntityType', as: 'eligibleCustomerType', label: 'Eligible Customer Type'
      # The duration for which the given offer is valid.
      property :eligible_duration, class_name: 'QuantitativeValue', as: 'eligibleDuration', label: 'Eligible Duration'
      # The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
      property :eligible_quantity, class_name: 'QuantitativeValue', as: 'eligibleQuantity', label: 'Eligible Quantity'
      # The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.
      property :eligible_region, class_names: %w[Text GeoShape], as: 'eligibleRegion', label: 'Eligible Region'
      # The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
      property :eligible_transaction_volume, class_name: 'PriceSpecification', as: 'eligibleTransactionVolume', label: 'Eligible Transaction Volume'
      # The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
      property :gtin13, class_name: 'Text', as: 'gtin13', label: 'Gtin13'
      # The GTIN-14 code of the product, or the product to which the offer refers.
      property :gtin14, class_name: 'Text', as: 'gtin14', label: 'Gtin14'
      # The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN.
      property :gtin8, class_name: 'Text', as: 'gtin8', label: 'Gtin8'
      # This links to a node or nodes indicating the exact quantity of the products included in the offer.
      property :includes_object, class_name: 'TypeAndQuantityNode', as: 'includesObject', label: 'Includes Object'
      # The current approximate inventory level for the item or items.
      property :inventory_level, class_name: 'QuantitativeValue', as: 'inventoryLevel', label: 'Inventory Level'
      # A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
      property :item_condition, class_name: 'OfferItemCondition', as: 'itemCondition', label: 'Item Condition'
      # The item being sold.
      property :item_offered, class_name: 'Product', as: 'itemOffered', label: 'Item Offered'
      # The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
      property :mpn, class_name: 'Text', as: 'mpn', label: 'Mpn'
      # One or more detailed price specifications, indicating the unit price and delivery or payment charges.
      property :price_specification, class_name: 'PriceSpecification', as: 'priceSpecification', label: 'Price Specification'
      # The seller.
      property :seller, class_names: %w[Organization Person], as: 'seller', label: 'Seller'
      # The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.
      property :serial_number, class_name: 'Text', as: 'serialNumber', label: 'Serial Number'
      # The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
      property :sku, class_name: 'Text', as: 'sku', label: 'Sku'
      # The beginning of the validity of offer, price specification, or opening hours data.
      property :valid_from, class_name: 'DateTime', as: 'validFrom', label: 'Valid From'
      # The end of the validity of offer, price specification, or opening hours data.
      property :valid_through, class_name: 'DateTime', as: 'validThrough', label: 'Valid Through'
      # The warranty promise(s) included in the offer.
      property :warranty, class_name: 'WarrantyPromise', as: 'warranty', label: 'Warranty'
    end
  end
end


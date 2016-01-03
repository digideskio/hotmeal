# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/intangible'

module Hotmeal
  module Schema
    # Parcel Delivery
    #
    # @see http://schema.org/ParcelDelivery
    class ParcelDelivery < Intangible
      # The party responsible for the parcel delivery.
      property :carrier, class_name: 'Organization', as: 'carrier', label: 'Carrier'
      # Destination address.
      property :delivery_address, class_name: 'PostalAddress', as: 'deliveryAddress', label: 'Delivery Address'
      # New entry added as the package passes through each leg of its journey (from shipment to final delivery).
      property :delivery_status, class_name: 'DeliveryEvent', as: 'deliveryStatus', label: 'Delivery Status'
      # The earliest date the package may arrive.
      property :expected_arrival_from, class_name: 'DateTime', as: 'expectedArrivalFrom', label: 'Expected Arrival From'
      # The latest date the package may arrive.
      property :expected_arrival_until, class_name: 'DateTime', as: 'expectedArrivalUntil', label: 'Expected Arrival Until'
      # Method used for delivery or shipping.
      property :has_delivery_method, class_name: 'DeliveryMethod', as: 'hasDeliveryMethod', label: 'Has Delivery Method'
      # Item(s) being shipped.
      property :item_shipped, class_name: 'Product', as: 'itemShipped', label: 'Item Shipped'
      # Shipper's address.
      property :origin_address, class_name: 'PostalAddress', as: 'originAddress', label: 'Origin Address'
      # The overall order the items in this delivery were included in.
      property :part_of_order, class_name: 'Order', as: 'partOfOrder', label: 'Part of Order'
      # Shipper tracking number.
      property :tracking_number, class_name: 'Text', as: 'trackingNumber', label: 'Tracking Number'
      # Tracking url for the parcel delivery.
      property :tracking_url, class_name: 'URL', as: 'trackingUrl', label: 'Tracking Url'
    end
  end
end

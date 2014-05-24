# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/event'

module Hotmeal
  module Schema
    # Delivery Event
    #
    # @see http://schema.org/DeliveryEvent
    class DeliveryEvent < Event
      # Password, PIN, or access code needed for delivery (e.g. from a locker).
      property :access_code, class_name: 'Text', as: 'accessCode', label: 'Access Code'
      # When the item is available for pickup from the store, locker, etc.
      property :available_from, class_name: 'DateTime', as: 'availableFrom', label: 'Available From'
      # After this date, the item will no longer be available for pickup.
      property :available_through, class_name: 'DateTime', as: 'availableThrough', label: 'Available Through'
      # Method used for delivery or shipping.
      property :has_delivery_method, class_name: 'DeliveryMethod', as: 'hasDeliveryMethod', label: 'Has Delivery Method'
    end
  end
end


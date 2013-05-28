# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Individual Product
    #
    # A single, identifiable product instance (e.g. a laptop with a particular serial number).
    # @see http://schema.org/IndividualProduct
    class IndividualProduct < Product
      # The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.
      property :serial_number, class_name: 'Text', as: 'serialNumber', label: 'Serial Number'
    end
  end
end


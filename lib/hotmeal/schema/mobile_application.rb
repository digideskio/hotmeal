# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Mobile Application
    #
    # A mobile software application.
    # @see http://schema.org/MobileApplication
    class MobileApplication < SoftwareApplication
      # Specifies specific carrier(s) requirements for the application (e.g. an application may only work on a specific carrier network).
      property :carrier_requirements, class_name: 'Text', as: 'carrierRequirements', label: 'Carrier Requirements'
    end
  end
end

# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/intangible'

module Hotmeal
  module Schema
    # Brand
    #
    # @see http://schema.org/Brand
    class Brand < Intangible
      # A logo associated with an organization.
      property :logo, class_names: %w[URL ImageObject], as: 'logo', label: 'Logo'
    end
  end
end


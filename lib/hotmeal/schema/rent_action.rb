# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/trade_action'

module Hotmeal
  module Schema
    # Rent Action
    #
    # @see http://schema.org/RentAction
    class RentAction < TradeAction
      # A sub property of participant. The owner of the real estate property. Sub property of destination or participant?
      property :landlord, class_names: %w[Organization Person], as: 'landlord', label: 'Landlord'
      # A sub property of participant. The real estate agent involved in the action.
      property :real_estate_agent, class_name: 'RealEstateAgent', as: 'realEstateAgent', label: 'Real Estate Agent'
    end
  end
end


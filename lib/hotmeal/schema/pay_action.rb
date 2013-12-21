# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/trade_action'

module Hotmeal
  module Schema
    # Pay Action
    #
    # @see http://schema.org/PayAction
    class PayAction < TradeAction
      # A goal towards an action is taken. Can be concrete or abstract.
      property :purpose, class_names: %w[Thing MedicalDevicePurpose], as: 'purpose', label: 'Purpose'
      # A sub property of participant. The participant who is at the receiving end of the action.
      property :recipient, class_names: %w[Organization Audience Person], as: 'recipient', label: 'Recipient'
    end
  end
end

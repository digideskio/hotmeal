# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/trade_action'

module Hotmeal
  module Schema
    # Tip Action
    #
    # @see http://schema.org/TipAction
    class TipAction < TradeAction
      # A sub property of participant. The participant who is at the receiving end of the action.
      property :recipient, class_names: %w[Organization Audience Person], as: 'recipient', label: 'Recipient'
    end
  end
end


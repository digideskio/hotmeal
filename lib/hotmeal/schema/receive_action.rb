# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/transfer_action'

module Hotmeal
  module Schema
    # Receive Action
    #
    # @see http://schema.org/ReceiveAction
    class ReceiveAction < TransferAction
      # A sub property of instrument. The method of delivery
      property :delivery_method, class_name: 'DeliveryMethod', as: 'deliveryMethod', label: 'Delivery Method'
      # A sub property of participant. The participant who is at the sending end of the action.
      property :sender, class_names: %w[Audience Organization Person], as: 'sender', label: 'Sender'
    end
  end
end


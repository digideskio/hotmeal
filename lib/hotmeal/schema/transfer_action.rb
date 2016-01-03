# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/action'

module Hotmeal
  module Schema
    # Transfer Action
    #
    # @see http://schema.org/TransferAction
    #
    # Subtypes:
    # @see BorrowAction
    # @see DownloadAction
    # @see GiveAction
    # @see LendAction
    # @see ReceiveAction
    # @see ReturnAction
    # @see SendAction
    # @see TakeAction
    class TransferAction < Action
      # A sub property of location. The original location of the object or the agent before the action.
      property :from_location, class_names: %w(Place Number), as: 'fromLocation', label: 'From Location'
      # A sub property of location. The final location of the object or the agent after the action.
      property :to_location, class_names: %w(Place Number), as: 'toLocation', label: 'To Location'
    end
  end
end

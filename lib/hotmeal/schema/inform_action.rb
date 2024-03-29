# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/communicate_action'

module Hotmeal
  module Schema
    # Inform Action
    #
    # @see http://schema.org/InformAction
    #
    # Subtypes:
    # @see ConfirmAction
    # @see RsvpAction
    class InformAction < CommunicateAction
      # Upcoming or past event associated with this place or organization.
      property :event, class_name: 'Event', as: 'event', label: 'Event'
    end
  end
end

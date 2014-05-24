# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/communicate_action'

module Hotmeal
  module Schema
    # Invite Action
    #
    # @see http://schema.org/InviteAction
    class InviteAction < CommunicateAction
      # Upcoming or past event associated with this place or organization.
      property :event, class_name: 'Event', as: 'event', label: 'Event'
    end
  end
end


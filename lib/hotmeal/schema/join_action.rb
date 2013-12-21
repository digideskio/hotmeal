# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/interact_action'

module Hotmeal
  module Schema
    # Join Action
    #
    # @see http://schema.org/JoinAction
    class JoinAction < InteractAction
      # Upcoming or past event associated with this place or organization.
      property :event, class_name: 'Event', as: 'event', label: 'Event'
    end
  end
end

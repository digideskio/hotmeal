# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/action'

module Hotmeal
  module Schema
    # Play Action
    #
    # @see http://schema.org/PlayAction
    #
    # Subtypes:
    # @see ExerciseAction
    # @see PerformAction
    class PlayAction < Action
      # The intended audience of the item, i.e. the group for whom the item was created.
      property :audience, class_name: 'Audience', as: 'audience', label: 'Audience'
      # Upcoming or past event associated with this place or organization.
      property :event, class_name: 'Event', as: 'event', label: 'Event'
    end
  end
end


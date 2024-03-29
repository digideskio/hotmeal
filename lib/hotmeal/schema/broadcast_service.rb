# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/thing'

module Hotmeal
  module Schema
    # Broadcast Service
    #
    # @see http://schema.org/BroadcastService
    class BroadcastService < Thing
      # The area within which users can expect to reach the broadcast service.
      property :area, class_name: 'Place', as: 'area', label: 'Area'
      # The organization owning or operating the broadcast service.
      property :broadcaster, class_name: 'Organization', as: 'broadcaster', label: 'Broadcaster'
      # A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.
      property :parent_service, class_name: 'BroadcastService', as: 'parentService', label: 'Parent Service'
    end
  end
end

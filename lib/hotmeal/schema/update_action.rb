# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/action'

module Hotmeal
  module Schema
    # Update Action
    #
    # @see http://schema.org/UpdateAction
    #
    # Subtypes:
    # @see AddAction
    # @see DeleteAction
    # @see ReplaceAction
    class UpdateAction < Action
      # A sub property of object. The collection target of the action.
      property :collection, class_name: 'Thing', as: 'collection', label: 'Collection'
    end
  end
end


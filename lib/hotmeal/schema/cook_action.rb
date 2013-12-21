# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/create_action'

module Hotmeal
  module Schema
    # Cook Action
    #
    # @see http://schema.org/CookAction
    class CookAction < CreateAction
      # A sub property of location. The specific food establishment where the action occurreed.
      property :food_establishment, class_names: %w[FoodEstablishment Place], as: 'foodEstablishment', label: 'Food Establishment'
      # A sub property of location. The specific food event where the action occurred.
      property :food_event, class_name: 'FoodEvent', as: 'foodEvent', label: 'Food Event'
      # A sub property of instrument. The recipe/instructions used to perform the action.
      property :recipe, class_name: 'Recipe', as: 'recipe', label: 'Recipe'
    end
  end
end

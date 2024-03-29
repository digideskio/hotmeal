# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/lifestyle_modification'

module Hotmeal
  module Schema
    # Physical Activity
    #
    # @see http://schema.org/PhysicalActivity
    #
    # Subtypes:
    # @see ExercisePlan
    class PhysicalActivity < LifestyleModification
      # The anatomy of the underlying organ system or structures associated with this entity.
      property :associated_anatomy, class_names: %w(AnatomicalSystem SuperficialAnatomy AnatomicalStructure), as: 'associatedAnatomy', label: 'Associated Anatomy'
      # A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.
      property :category, class_names: %w(Text PhysicalActivityCategory Thing), as: 'category', label: 'Category'
      # The characteristics of associated patients, such as age, gender, race etc.
      property :epidemiology, class_name: 'Text', as: 'epidemiology', label: 'Epidemiology'
      # Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.
      property :pathophysiology, class_name: 'Text', as: 'pathophysiology', label: 'Pathophysiology'
    end
  end
end

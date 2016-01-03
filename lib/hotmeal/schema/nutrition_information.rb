# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/structured_value'

module Hotmeal
  module Schema
    # Nutrition Information
    #
    # @see http://schema.org/NutritionInformation
    class NutritionInformation < StructuredValue
      # The number of calories
      property :calories, class_name: 'Energy', as: 'calories', label: 'Calories'
      # The number of grams of carbohydrates.
      property :carbohydrate_content, class_name: 'Mass', as: 'carbohydrateContent', label: 'Carbohydrate Content'
      # The number of milligrams of cholesterol.
      property :cholesterol_content, class_name: 'Mass', as: 'cholesterolContent', label: 'Cholesterol Content'
      # The number of grams of fat.
      property :fat_content, class_name: 'Mass', as: 'fatContent', label: 'Fat Content'
      # The number of grams of fiber.
      property :fiber_content, class_name: 'Mass', as: 'fiberContent', label: 'Fiber Content'
      # The number of grams of protein.
      property :protein_content, class_name: 'Mass', as: 'proteinContent', label: 'Protein Content'
      # The number of grams of saturated fat.
      property :saturated_fat_content, class_name: 'Mass', as: 'saturatedFatContent', label: 'Saturated Fat Content'
      # The serving size, in terms of the number of volume or mass
      property :serving_size, class_name: 'Text', as: 'servingSize', label: 'Serving Size'
      # The number of milligrams of sodium.
      property :sodium_content, class_name: 'Mass', as: 'sodiumContent', label: 'Sodium Content'
      # The number of grams of sugar.
      property :sugar_content, class_name: 'Mass', as: 'sugarContent', label: 'Sugar Content'
      # The number of grams of trans fat.
      property :trans_fat_content, class_name: 'Mass', as: 'transFatContent', label: 'Trans Fat Content'
      # The number of grams of unsaturated fat.
      property :unsaturated_fat_content, class_name: 'Mass', as: 'unsaturatedFatContent', label: 'Unsaturated Fat Content'
    end
  end
end

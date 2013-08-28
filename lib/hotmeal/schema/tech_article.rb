# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/article'

module Hotmeal
  module Schema
    # Tech Article
    #
    # @see http://schema.org/TechArticle
    #
    # Subtypes:
    # @see APIReference
    class TechArticle < Article
      # Prerequisites needed to fulfill steps in article.
      property :dependencies, class_name: 'Text', as: 'dependencies', label: 'Dependencies'
      # Proficiency needed for this content; expected values: 'Beginner', 'Expert'.
      property :proficiency_level, class_name: 'Text', as: 'proficiencyLevel', label: 'Proficiency Level'
    end
  end
end


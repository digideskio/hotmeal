# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/intangible'

module Hotmeal
  module Schema
    # Alignment Object
    #
    # An intangible item that describes an alignment between a learning resource and a node in an educational framework.
    # @see http://schema.org/AlignmentObject
    class AlignmentObject < Intangible
      # A category of alignment between the learning resource and the framework node. Recommended values include: 'assesses', 'teaches', 'requires', 'textComplexity', 'readingLevel', 'educationalSubject', and 'educationLevel'.
      property :alignment_type, class_name: 'Text', as: 'alignmentType', label: 'Alignment Type'
      # The framework to which the resource being described is aligned.
      property :educational_framework, class_name: 'Text', as: 'educationalFramework', label: 'Educational Framework'
      # The description of a node in an established educational framework.
      property :target_description, class_name: 'Text', as: 'targetDescription', label: 'Target Description'
      # The name of a node in an established educational framework.
      property :target_name, class_name: 'Text', as: 'targetName', label: 'Target Name'
      # The URL of a node in an established educational framework.
      property :target_url, class_name: 'URL', as: 'targetUrl', label: 'Target Url'
    end
  end
end


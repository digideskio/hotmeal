# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Anatomical Structure
    #
    # Any part of the human body, typically a component of an anatomical system. Organs, tissues, and cells are all anatomical structures.
    # @see http://schema.org/AnatomicalStructure
    #
    # Subtypes:
    # @see Bone
    # @see BrainStructure
    # @see Joint
    # @see Ligament
    # @see Muscle
    # @see Nerve
    # @see Vessel
    class AnatomicalStructure < MedicalEntity
      # If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.
      property :associated_pathophysiology, class_name: 'Text', as: 'associatedPathophysiology', label: 'Associated Pathophysiology'
      # Location in the body of the anatomical structure.
      property :body_location, class_name: 'Text', as: 'bodyLocation', label: 'Body Location'
      # Other anatomical structures to which this structure is connected.
      property :connected_to, class_name: 'AnatomicalStructure', as: 'connectedTo', label: 'Connected to'
      # An image containing a diagram that illustrates the structure and/or its component substructures and/or connections with other structures.
      property :diagram, class_name: 'ImageObject', as: 'diagram', label: 'Diagram'
      # Function of the anatomical structure.
      property :function, class_name: 'Text', as: 'function', label: 'Function'
      # The anatomical or organ system that this structure is part of.
      property :part_of_system, class_name: 'AnatomicalSystem', as: 'partOfSystem', label: 'Part of System'
      # A medical condition associated with this anatomy.
      property :related_condition, class_name: 'MedicalCondition', as: 'relatedCondition', label: 'Related Condition'
      # A medical therapy related to this anatomy.
      property :related_therapy, class_name: 'MedicalTherapy', as: 'relatedTherapy', label: 'Related Therapy'
      # Component (sub-)structure(s) that comprise this anatomical structure.
      property :sub_structure, class_name: 'AnatomicalStructure', as: 'subStructure', label: 'Sub Structure'
    end
  end
end

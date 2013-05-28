# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Anatomical System
    #
    # An anatomical system is a group of anatomical structures that work together to perform a certain task. Anatomical systems, such as organ systems, are one organizing principle of anatomy, and can includes circulatory, digestive, endocrine, integumentary, immune, lymphatic, muscular, nervous, reproductive, respiratory, skeletal, urinary, vestibular, and other systems.
    # @see http://schema.org/AnatomicalSystem
    class AnatomicalSystem < MedicalEntity
      # If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.
      property :associated_pathophysiology, class_name: 'Text', as: 'associatedPathophysiology', label: 'Associated Pathophysiology'
      # The underlying anatomical structures, such as organs, that comprise the anatomical system.
      property :comprised_of, class_names: %w[AnatomicalStructure AnatomicalSystem], as: 'comprisedOf', label: 'Comprised of'
      # A medical condition associated with this anatomy.
      property :related_condition, class_name: 'MedicalCondition', as: 'relatedCondition', label: 'Related Condition'
      # Related anatomical structure(s) that are not part of the system but relate or connect to it, such as vascular bundles associated with an organ system.
      property :related_structure, class_name: 'AnatomicalStructure', as: 'relatedStructure', label: 'Related Structure'
      # A medical therapy related to this anatomy.
      property :related_therapy, class_name: 'MedicalTherapy', as: 'relatedTherapy', label: 'Related Therapy'
    end
  end
end

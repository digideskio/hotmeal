# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/medical_entity'

module Hotmeal
  module Schema
    # Medical Procedure
    #
    # @see http://schema.org/MedicalProcedure
    #
    # Subtypes:
    # @see DiagnosticProcedure
    # @see PalliativeProcedure
    # @see TherapeuticProcedure
    class MedicalProcedure < MedicalEntity
      # Typical or recommended followup care after the procedure is performed.
      property :followup, class_name: 'Text', as: 'followup', label: 'Followup'
      # How the procedure is performed.
      property :how_performed, class_name: 'Text', as: 'howPerformed', label: 'How Performed'
      # Typical preparation that a patient must undergo before having the procedure performed.
      property :preparation, class_name: 'Text', as: 'preparation', label: 'Preparation'
      # The type of procedure, for example Surgical, Noninvasive, or Percutaneous.
      property :procedure_type, class_name: 'MedicalProcedureType', as: 'procedureType', label: 'Procedure Type'
    end
  end
end

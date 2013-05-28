# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Medical Observational Study
    #
    # An observational study is a type of medical study that attempts to infer the possible effect of a treatment through observation of a cohort of subjects over a period of time. In an observational study, the assignment of subjects into treatment groups versus control groups is outside the control of the investigator. This is in contrast with controlled studies, such as the randomized controlled trials represented by MedicalTrial, where each subject is randomly assigned to a treatment group or a control group before the start of the treatment.
    # @see http://schema.org/MedicalObservationalStudy
    class MedicalObservationalStudy < MedicalStudy
      # Specifics about the observational study design (enumerated).
      property :study_design, class_name: 'MedicalObservationalStudyDesign', as: 'studyDesign', label: 'Study Design'
    end
  end
end


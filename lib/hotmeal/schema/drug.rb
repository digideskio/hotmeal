# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Drug
    #
    # A chemical or biologic substance, used as a medical therapy, that has a physiological effect on an organism.
    # @see http://schema.org/Drug
    class Drug < MedicalTherapy
      # An active ingredient, typically chemical compounds and/or biologic substances.
      property :active_ingredient, class_name: 'Text', as: 'activeIngredient', label: 'Active Ingredient'
      # A route by which this drug may be administered, e.g. 'oral'.
      property :administration_route, class_name: 'Text', as: 'administrationRoute', label: 'Administration Route'
      # Any precaution, guidance, contraindication, etc. related to consumption of alcohol while taking this drug.
      property :alcohol_warning, class_name: 'Text', as: 'alcoholWarning', label: 'Alcohol Warning'
      # An available dosage strength for the drug.
      property :available_strength, class_name: 'DrugStrength', as: 'availableStrength', label: 'Available Strength'
      # Any precaution, guidance, contraindication, etc. related to this drug's use by breastfeeding mothers.
      property :breastfeeding_warning, class_name: 'Text', as: 'breastfeedingWarning', label: 'Breastfeeding Warning'
      # Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).
      property :clincal_pharmacology, class_name: 'Text', as: 'clincalPharmacology', label: 'Clincal Pharmacology'
      # Cost per unit of the drug, as reported by the source being tagged.
      property :cost, class_name: 'DrugCost', as: 'cost', label: 'Cost'
      # A dosage form in which this drug/supplement is available, e.g. 'tablet', 'suspension', 'injection'.
      property :dosage_form, class_name: 'Text', as: 'dosageForm', label: 'Dosage Form'
      # A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.
      property :dose_schedule, class_name: 'DoseSchedule', as: 'doseSchedule', label: 'Dose Schedule'
      # The class of drug this belongs to (e.g., statins).
      property :drug_class, class_name: 'DrugClass', as: 'drugClass', label: 'Drug Class'
      # Any precaution, guidance, contraindication, etc. related to consumption of specific foods while taking this drug.
      property :food_warning, class_name: 'Text', as: 'foodWarning', label: 'Food Warning'
      # Another drug that is known to interact with this drug in a way that impacts the effect of this drug or causes a risk to the patient. Note: disease interactions are typically captured as contraindications.
      property :interacting_drug, class_name: 'Drug', as: 'interactingDrug', label: 'Interacting Drug'
      # True if the drug is available in a generic form (regardless of name).
      property :is_available_generically, class_name: 'Boolean', as: 'isAvailableGenerically', label: 'Is Available Generically'
      # True if this item's name is a proprietary/brand name (vs. generic name).
      property :is_proprietary, class_name: 'Boolean', as: 'isProprietary', label: 'Is Proprietary'
      # Link to the drug's label details.
      property :label_details, class_name: 'URL', as: 'labelDetails', label: 'Label Details'
      # The drug or supplement's legal status, including any controlled substance schedules that apply.
      property :legal_status, class_name: 'DrugLegalStatus', as: 'legalStatus', label: 'Legal Status'
      # The manufacturer of the product.
      property :manufacturer, class_name: 'Organization', as: 'manufacturer', label: 'Manufacturer'
      # The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.
      property :mechanism_of_action, class_name: 'Text', as: 'mechanismOfAction', label: 'Mechanism of Action'
      # The generic name of this drug or supplement.
      property :non_proprietary_name, class_name: 'Text', as: 'nonProprietaryName', label: 'Non Proprietary Name'
      # Any information related to overdose on a drug, including signs or symptoms, treatments, contact information for emergency response.
      property :overdosage, class_name: 'Text', as: 'overdosage', label: 'Overdosage'
      # Pregnancy category of this drug.
      property :pregnancy_category, class_name: 'DrugPregnancyCategory', as: 'pregnancyCategory', label: 'Pregnancy Category'
      # Any precaution, guidance, contraindication, etc. related to this drug's use during pregnancy.
      property :pregnancy_warning, class_name: 'Text', as: 'pregnancyWarning', label: 'Pregnancy Warning'
      # Link to prescribing information for the drug.
      property :prescribing_info, class_name: 'URL', as: 'prescribingInfo', label: 'Prescribing Info'
      # Indicates whether this drug is available by prescription or over-the-counter.
      property :prescription_status, class_name: 'DrugPrescriptionStatus', as: 'prescriptionStatus', label: 'Prescription Status'
      # Any other drug related to this one, for example commonly-prescribed alternatives.
      property :related_drug, class_name: 'Drug', as: 'relatedDrug', label: 'Related Drug'
      # Any FDA or other warnings about the drug (text or URL).
      property :warning, class_names: %w[Text URL], as: 'warning', label: 'Warning'
    end
  end
end

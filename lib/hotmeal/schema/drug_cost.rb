# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'
require 'hotmeal/schema/medical_intangible'

module Hotmeal
  module Schema
    # Drug Cost
    #
    # The cost per unit of a medical drug. Note that this type is not meant to represent the price in an offer of a drug for sale; see the Offer type for that. This type will typically be used to tag wholesale or average retail cost of a drug, or maximum reimbursable cost. Costs of medical drugs vary widely depending on how and where they are paid for, so while this type captures some of the variables, costs should be used with caution by consumers of this schema's markup.
    # @see http://schema.org/DrugCost
    class DrugCost < MedicalIntangible
      # The location in which the status applies.
      property :applicable_location, class_name: 'AdministrativeArea', as: 'applicableLocation', label: 'Applicable Location'
      # The category of cost, such as wholesale, retail, reimbursement cap, etc.
      property :cost_category, class_name: 'DrugCostCategory', as: 'costCategory', label: 'Cost Category'
      # The currency (in 3-letter ISO 4217 format) of the drug cost.
      property :cost_currency, class_name: 'Text', as: 'costCurrency', label: 'Cost Currency'
      # Additional details to capture the origin of the cost data. For example, 'Medicare Part B'.
      property :cost_origin, class_name: 'Text', as: 'costOrigin', label: 'Cost Origin'
      # The cost per unit of the drug.
      property :cost_per_unit, class_names: %w[Number Text], as: 'costPerUnit', label: 'Cost Per Unit'
      # The unit in which the drug is measured, e.g. '5 mg tablet'.
      property :drug_unit, class_name: 'Text', as: 'drugUnit', label: 'Drug Unit'
    end
  end
end


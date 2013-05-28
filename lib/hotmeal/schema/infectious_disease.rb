# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Infectious Disease
    #
    # An infectious disease is a clinically evident human disease resulting from the presence of pathogenic microbial agents, like pathogenic viruses, pathogenic bacteria, fungi, protozoa, multicellular parasites, and prions. To be considered an infectious disease, such pathogens are known to be able to cause this disease.
    # @see http://schema.org/InfectiousDisease
    class InfectiousDisease < MedicalCondition
      # The actual infectious agent, such as a specific bacterium.
      property :infectious_agent, class_name: 'Text', as: 'infectiousAgent', label: 'Infectious Agent'
      # The class of infectious agent (bacteria, prion, etc.) that causes the disease.
      property :infectious_agent_class, class_name: 'InfectiousAgentClass', as: 'infectiousAgentClass', label: 'Infectious Agent Class'
      # How the disease spreads, either as a route or vector, for example 'direct contact', 'Aedes aegypti', etc.
      property :transmission_method, class_name: 'Text', as: 'transmissionMethod', label: 'Transmission Method'
    end
  end
end


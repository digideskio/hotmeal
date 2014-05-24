# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/creative_work'

module Hotmeal
  module Schema
    # Dataset
    #
    # @see http://schema.org/Dataset
    class Dataset < CreativeWork
      # A data catalog which contains a dataset.
      property :catalog, class_name: 'DataCatalog', as: 'catalog', label: 'Catalog'
      # A downloadable form of this dataset, at a specific location, in a specific format.
      property :distribution, class_name: 'DataDownload', as: 'distribution', label: 'Distribution'
      # The range of spatial applicability of a dataset, e.g. for a dataset of New York weather, the state of New York.
      property :spatial, class_name: 'Place', as: 'spatial', label: 'Spatial'
      # The range of temporal applicability of a dataset, e.g. for a 2011 census dataset, the year 2011 (in ISO 8601 time interval format).
      property :temporal, class_name: 'DateTime', as: 'temporal', label: 'Temporal'
    end
  end
end


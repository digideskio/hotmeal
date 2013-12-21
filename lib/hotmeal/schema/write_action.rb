# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-08-28
require 'hotmeal/schema'
require 'hotmeal/schema/create_action'

module Hotmeal
  module Schema
    # Write Action
    #
    # @see http://schema.org/WriteAction
    class WriteAction < CreateAction
      # A sub property of instrument. The languaged used on this action.
      property :language, class_name: 'Language', as: 'language', label: 'Language'
    end
  end
end

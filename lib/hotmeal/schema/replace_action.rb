# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/update_action'

module Hotmeal
  module Schema
    # Replace Action
    #
    # @see http://schema.org/ReplaceAction
    class ReplaceAction < UpdateAction
      # A sub property of object. The object that is being replaced.
      property :replacee, class_name: 'Thing', as: 'replacee', label: 'Replacee'
      # A sub property of object. The object that replaces.
      property :replacer, class_name: 'Thing', as: 'replacer', label: 'Replacer'
    end
  end
end

# This file is automatically generated using http://schema.rdfs.org/all.json
# 2014-04-03
require 'hotmeal/schema'
require 'hotmeal/schema/clip'

module Hotmeal
  module Schema
    # TV Clip
    #
    # @see http://schema.org/TVClip
    class TVClip < Clip
      # The TV series to which this episode or season belongs. (legacy form; partOfSeries is preferred)
      property :part_of_tv_series, class_name: 'TVSeries', as: 'partOfTVSeries', label: 'Part of TV Series'
    end
  end
end

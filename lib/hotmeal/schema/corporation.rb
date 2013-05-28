# This file is automatically generated using http://schema.rdfs.org/all.json
# 2013-05-28
require 'hotmeal/schema'

module Hotmeal
  module Schema
    # Corporation
    #
    # Organization: A business corporation.
    # @see http://schema.org/Corporation
    class Corporation < Organization
      # The exchange traded instrument associated with a Corporation object. The tickerSymbol is expressed as an exchange and an instrument name separated by a space character. For the exchange component of the tickerSymbol attribute, we reccommend using the controlled vocaulary of Market Identifier Codes (MIC) specified in ISO15022.
      property :ticker_symbol, class_name: 'Text', as: 'tickerSymbol', label: 'Ticker Symbol'
    end
  end
end

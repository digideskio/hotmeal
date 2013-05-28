module Hotmeal
end

require 'hotmeal/version'
require 'hotmeal/base'
require 'hotmeal/schema'

def Hotmeal(html)
  Hotmeal::Base.new(html)
end

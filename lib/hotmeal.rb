module Hotmeal
end

require 'hotmeal/version'
require 'hotmeal/base'

def Hotmeal(html)
  Hotmeal::Base.new(html)
end

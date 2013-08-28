require 'active_support'
module Hotmeal
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :Meta
  autoload :MicroData
  autoload :OpenGraph
  autoload :Schema
end

require 'hotmeal/version'
require 'hotmeal/base'
require 'hotmeal/schema'

def Hotmeal(html)
  Hotmeal::Base.new(html)
end

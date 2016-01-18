require 'hotmeal'
require 'active_support'

module Hotmeal
  module Html
    extend ActiveSupport::Autoload

    autoload :Body
    autoload :Document
    autoload :Head
    autoload :Link
    autoload :Links
    autoload :Meta
    autoload :MetaData
  end
end

require 'hotmeal/html'
require 'hotmeal/mapper/decorator'

module Hotmeal
  module Html
    class Document < Html
      # @return [String]
      delegate :title, to: :head
      # @return [Hotmeal::Html::MetaData]
      delegate :meta, to: :head
      # @return [Array<String>] array of keywords
      delegate :keywords, to: :meta
    end
  end
end

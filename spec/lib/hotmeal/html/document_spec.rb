require 'spec_helper'

RSpec.describe Hotmeal::Html::Document do

  it { should respond_to(:title) }
  it { should respond_to(:meta) }
  it { should respond_to(:keywords) }
  it { should respond_to(:description) }
  it { should respond_to(:document_title) }
  it { should respond_to(:html_prefix) }
  it { should respond_to(:meta_charset) }

  let(:html) { fixture(:open_graph) }
  subject(:document) do
    Hotmeal::Html::Document.new(html).tap { |doc| doc.head.meta.charset } # Preload charset by Nokogiri
  end
end

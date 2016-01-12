require 'spec_helper'

describe Hotmeal::Document do
  let(:html) { fixture(:basic) }
  subject(:document) { Hotmeal::Document.new(html) }

  its(:document_title) { should == 'HTML file' }
  its(:title) { should == 'HTML file' }

  it { should respond_to?(:meta) }
  its(:meta) { should be_an(Hotmeal::Meta::Meta) }
  its(:meta_charset) { should == 'utf-8' }
end

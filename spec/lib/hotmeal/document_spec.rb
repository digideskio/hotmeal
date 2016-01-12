require 'spec_helper'

describe Hotmeal::Document do
  let(:html) { fixture(:basic) }
  subject(:document) { Hotmeal::Document.new(html) }

  its(:document_title) { should == 'HTML file' }
  its(:title) { should == 'HTML file' }

  it { should respond_to?(:meta) }
  describe '#meta' do
    subject(:meta) { document.meta }
    its(:charset) { should == 'utf-8' }
    its(:name) { should have_key('keywords') }
    its(:name) { should have_key('description') }
    it { meta.name['keywords'].should == ['HTML, Basic, keyword, another'] }
    it { meta.name['description'].should == ['This is a basic HTML file.'] }
  end

  its(:meta_charset) { should == 'utf-8' }
end

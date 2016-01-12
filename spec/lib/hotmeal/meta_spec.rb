require 'spec_helper'

describe Hotmeal::Meta do
  let(:html) { fixture(:basic) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  it { should respond_to(:meta) }

  its(:keywords) { should == %w(HTML Basic keyword another) }
  its(:description) { should == 'This is a basic HTML file.' }

  describe Hotmeal::Meta do
    subject(:meta) { hotmeal.meta }

    its(:query) { should == '//meta' }
    its(:charset) { should == 'utf-8' }

    its(:name) { should have_key('keywords') }
    it { meta.name['keywords'].should == ['HTML, Basic, keyword, another'] }
    its(:keywords) { should == %w(HTML Basic keyword another) }

    its(:name) { should have_key('description') }
    it { meta.name['description'].should == ['This is a basic HTML file.'] }
    its(:description) { should == 'This is a basic HTML file.' }

    context '#properties' do
      let(:html) { fixture(:open_graph) }
      subject(:properties) { meta.properties }

      it { should have_key('og:title') }
      it { should have_key('og:type') }
      it { should have_key('og:url') }
      it { should have_key('og:image') }
      it { should have_key('og:description') }
    end
  end
end

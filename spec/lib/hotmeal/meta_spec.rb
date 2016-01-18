require 'spec_helper'

describe Hotmeal::Html::Meta do
  let(:html) { fixture(:basic) }
  subject(:hotmeal) { Hotmeal::Document.new(html) }

  it { should respond_to(:meta) }

  its(:keywords) { should == %w(HTML Basic keyword another) }
  its(:description) { should == 'This is a basic HTML file.' }

  describe Hotmeal::Html::Meta do
    subject(:meta) { hotmeal.meta }

    its(:charset) { should == 'utf-8' }

    describe 'name' do
      subject(:name) { meta.name }

      it { should be_a(Enumerable) }
      it { should respond_to('keywords') }
      it { should respond_to('description') }
      its(:keywords) { should == ['HTML, Basic, keyword, another'] }
      its(:description) { should == ['This is a basic HTML file.'] }
    end
    its(:keywords) { should == %w(HTML Basic keyword another) }
    its(:description) { should == 'This is a basic HTML file.' }

    context '#properties' do
      let(:html) { fixture(:open_graph) }
      subject(:properties) { meta.properties }

      it { should respond_to(:[]) }
      it { should have_key('og:title') }
      it { should have_key('og:type') }
      it { should have_key('og:url') }
      it { should have_key('og:image') }
      it { should have_key('og:description') }
    end
  end
end

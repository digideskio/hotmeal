require 'spec_helper'

describe Hotmeal::Meta do
  let(:html) { fixture(:basic) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  it { should respond_to(:meta) }

  its(:keywords) { should == %w(HTML Basic keyword another) }
  its(:description) { should == 'This is a basic HTML file.' }

  describe Hotmeal::Meta::Meta do
    subject { hotmeal.meta }
    its(:query) { should == '//meta' }
    its(:charset) { should == 'utf-8' }

    its(:name) do
      should == {
        'keywords' => ['HTML, Basic, keyword, another'],
        'description' => ['This is a basic HTML file.']
      }
    end

    its(:keywords) { should == %w(HTML Basic keyword another) }
    its(:description) { should == 'This is a basic HTML file.' }

    context '#properties' do
      let(:html) { fixture(:open_graph) }
      its(:properties) { should have_key('og:title') }
      its(:properties) { should have_key('og:type') }
      its(:properties) { should have_key('og:url') }
      its(:properties) { should have_key('og:image') }
      its(:properties) { should have_key('og:description') }
    end
  end
end

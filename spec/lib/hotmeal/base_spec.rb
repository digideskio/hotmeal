require 'spec_helper'

describe Hotmeal::Document do
  let(:html) { fixture(:basic) }
  subject(:hotmeal) { described_class.new(html) }

  its(:document_title) { should == 'HTML file' }
  its(:inner_text) { should == 'HTML file' }
  its(:inner_html) { should == '<h1>HTML file</h1>' }

  its(:title) { should == 'HTML file' }

  its(:html_prefix) { should == {} }

  context '#html_prefix' do
    let(:html) { fixture(:open_graph) }

    its(:html_prefix) do
      should == {
        'http://ogp.me/ns#' => 'og',
        'http://www.facebook.com/2008/fbml' => 'fb'
      }
    end
  end
end

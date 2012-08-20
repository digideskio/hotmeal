require 'spec_helper'

describe Hotmeal::Base do
  let(:html) { fixture(:basic) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  its(:html_title)  { should == 'Basic HTML file' }
  its(:inner_text)  { should == 'Basic HTML file example' }
  its(:inner_html)  { should == '<h1>Basic HTML file example</h1>' }

  its(:title)       { should == 'Basic HTML file' }

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

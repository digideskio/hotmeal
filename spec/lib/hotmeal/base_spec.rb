require 'spec_helper'

describe Hotmeal::Base do
  let(:html) { fixture(:basic) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  its(:html_title)  { should == 'Basic HTML file' }
  its(:inner_text)  { should == 'Basic HTML file example' }
  its(:inner_html)  { should == '<h1>Basic HTML file example</h1>' }

  its(:title)       { should == 'Basic HTML file' }
end

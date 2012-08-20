require 'spec_helper'

describe Hotmeal::Base do
  let(:html) { fixture(:basic) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  its(:html_charset)  { should == 'utf-8' }
  its(:html_meta) do
    should == {
      keywords:    %(HTML, Basic, keyword, another),
      description: %(This is a basic HTML file.)
    }
  end
  its(:keywords)    { should == %w(HTML Basic keyword another) }
  its(:description) { should == %(This is a basic HTML file.) }
end

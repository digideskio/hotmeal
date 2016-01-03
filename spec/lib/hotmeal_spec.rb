require 'spec_helper'

describe Hotmeal do
  it { Hotmeal::VERSION.should == '0.0.1' }

  describe 'shortcut' do
    let(:hotmeal) { Hotmeal(fixture(:basic)) }
    subject { hotmeal }

    it { should be_kind_of(Hotmeal::Base) }
  end
end

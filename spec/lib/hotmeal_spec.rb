require 'spec_helper'

RSpec.describe Hotmeal do
  it { expect(Hotmeal::VERSION).to be == '0.0.1' }

  describe 'Kernel#Hotmeal' do
    subject(:hotmeal) { Hotmeal(fixture(:basic)) }

    it { should be_kind_of(Hotmeal::Document) }
  end
end

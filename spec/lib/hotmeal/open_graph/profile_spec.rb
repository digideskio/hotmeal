require 'spec_helper'

RSpec.describe Hotmeal::OpenGraph::Profile do
  describe 'class' do
    subject { described_class }

    its(:property_class) { should == 'profile' }
    its(:prefix) { should == 'profile:' }
  end
end

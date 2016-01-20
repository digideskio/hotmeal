require 'spec_helper'

RSpec.describe Hotmeal::OpenGraph::Profile do
  describe 'class' do
    subject { described_class }

    its(:property_class) { should == 'profile' }
    its(:namespace) { should == 'profile: http://ogp.me/ns/profile#' }
    its(:prefix) { should == 'profile:' }
  end
end

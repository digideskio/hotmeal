require 'spec_helper'

RSpec.describe Hotmeal::OpenGraph::Object do
  describe 'class' do
    subject { described_class }

    it { should respond_to(:ns) }
    it { should respond_to(:property_class) }

    its(:property_class) { should == 'object' }
    its(:namespace) { should == 'og: http://ogp.me/ns#' }
    its(:prefix) { should == 'og:' }
  end
end

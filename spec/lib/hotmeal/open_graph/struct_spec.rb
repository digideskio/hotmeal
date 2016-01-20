require 'spec_helper'

RSpec.describe Hotmeal::OpenGraph::Struct do
  describe 'class' do
    subject { described_class }

    it { should respond_to(:property) }
    it { should respond_to(:alias_property) }
  end
end

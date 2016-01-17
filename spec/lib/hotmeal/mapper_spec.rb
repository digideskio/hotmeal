require 'spec_helper'

RSpec.describe Hotmeal::Mapper do
  subject { described_class }

  describe 'module' do
    its(:constants) { should include(:Decorator) }
    its(:constants) { should include(:Attributes) }
    its(:constants) { should include(:Mapping) }
  end
end

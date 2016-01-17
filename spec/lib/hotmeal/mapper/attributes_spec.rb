require 'spec_helper'

RSpec.describe Hotmeal::Mapper::Attributes do
  subject { Hotmeal::Mapper::Decorator }

  it { should respond_to(:mappings) }
  it { should respond_to(:mapping_for) }
  it { should respond_to(:attribute) }
  it { should respond_to(:element) }
end

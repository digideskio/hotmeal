require 'spec_helper'

RSpec.describe Hotmeal::OpenGraph::DSL do
  subject { Hotmeal::OpenGraph.extend(described_class) }

  it { should respond_to(:ns) }
  it { should respond_to(:property) }
end

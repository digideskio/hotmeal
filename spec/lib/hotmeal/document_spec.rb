require 'spec_helper'

RSpec.describe Hotmeal::Document do
  it { should respond_to(:head) }
  it { should respond_to(:body) }
  it { should respond_to(:title) }
  it { should respond_to(:charset) }
  it { should respond_to(:url) }
  it { should respond_to(:open_graph) }
end

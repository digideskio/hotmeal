require 'spec_helper'

RSpec.describe Hotmeal::Html::Meta do
  it { should respond_to(:charset) }
  it { should respond_to(:name) }
  it { should respond_to(:property) }
  it { should respond_to(:content) }
  it { should respond_to(:http_equiv) }
end

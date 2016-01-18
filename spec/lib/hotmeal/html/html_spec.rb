require 'spec_helper'

RSpec.describe Hotmeal::Html::Html do
  it { should respond_to(:head) }
  it { should respond_to(:body) }
  it { should respond_to?(:meta) }

  its(:head) { should be_a(Hotmeal::Html::Head) }
  its(:body) { should be_a(Hotmeal::Html::Body) }
end

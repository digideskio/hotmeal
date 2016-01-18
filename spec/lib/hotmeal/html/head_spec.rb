require 'spec_helper'

RSpec.describe Hotmeal::Html::Head do
  it { should respond_to(:title) }
  it { should respond_to(:base_uri) }
  it { should respond_to(:meta) }
  it { should respond_to(:links) }

  its(:meta) { should be_a(Hotmeal::Html::MetaData) }
  its(:links) { should be_a(Hotmeal::Html::Links) }
  its(:base_uri) { should eq nil }
end

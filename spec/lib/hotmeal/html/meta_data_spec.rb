require 'spec_helper'

RSpec.describe Hotmeal::Html::MetaData, type: :collection  do
  subject(:meta_data) { Hotmeal::Html::MetaData.new }

  it { should respond_to(:name) }
  it { should respond_to(:property) }
  it { should respond_to(:http_equiv) }
  it { should respond_to(:keywords) }
  it { should respond_to(:description) }
  it { should respond_to(:properties) }

  describe :name do
    subject { meta_data.name }

    it { should be_a(Enumerable) }
    it { should respond_to?(:keywords) }
    it { should respond_to?(:description) }
  end

  describe :property do
    subject { meta_data.property }

    it { should be_a(Enumerable) }
  end

  describe :http_equiv do
    subject { meta_data.http_equiv }

    it { should be_a(Enumerable) }
  end

  describe :properties do
    subject(:properties) { meta_data.properties }

    it { should respond_to(:[]) }
  end
end

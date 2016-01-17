require 'spec_helper'

RSpec.describe Hotmeal::Mapper::Decorator do
  subject { described_class }

  it { should be < SimpleDelegator }
  describe 'new' do
    subject(:mapper) { described_class.new(node) }

    describe '(nil)' do
      let(:node) { nil }

      it { should be == nil }
      its(:html) { should be_a(NilClass) }
      its(:to_html) { should be_a(String) }
      its(:to_html) { should be == '' }
    end

    describe '(html)' do
      let(:node) { Nokogiri::HTML(fixture(:basic)) }

      it { should_not be == nil }
      its(:html) { should be_a(Nokogiri::XML::Node) }
      its(:to_html) { should be_a(String) }
    end
  end
end

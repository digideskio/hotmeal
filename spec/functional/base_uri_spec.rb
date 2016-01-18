require 'spec_helper'

RSpec.describe 'base_uri.html', type: :functional do
  let(:fixture_name) { :base_uri }

  describe 'head' do
    subject(:head) { document.head }

    its(:base_uri) { should == 'http://example.com/blog/' }
  end

  describe 'body' do
    subject(:body) { document.body }

    it { should respond_to(:links) }
  end
end

require 'spec_helper'

RSpec.describe 'base_uri.html', type: :functional do
  let(:fixture_name) { :base_uri }

  describe :head do
    subject(:head) { document.head }

    its(:base_uri) { should == 'http://example.com/blog/' }
  end

  describe :body do
    subject(:body) { document.body }

    describe :links do
      subject(:links) { body.links }

      its(:size) { should == 1 }
      # its('first.href') { should == 'http://example.com/blog/basic.html' }
    end
  end
end

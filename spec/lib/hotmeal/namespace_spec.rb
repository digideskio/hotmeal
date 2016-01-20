require 'spec_helper'

RSpec.describe Hotmeal::Namespace do
  it { respond_to :uri }
  it { respond_to :ns }
  it { respond_to :prefix }

  context 'og' do
    subject { Hotmeal::Namespace.og }

    it { should == 'og: http://ogp.me/ns#' }
    its(:uri) { should == 'http://ogp.me/ns#' }
    its(:ns) { should == :og }
    its(:prefix) { should == 'og:' }
  end

  context 'fb' do
    subject { Hotmeal::Namespace.for('http://ogp.me/ns/fb#') }

    it { should == 'fb: http://ogp.me/ns/fb#' }
    its(:uri) { should == 'http://ogp.me/ns/fb#' }
    its(:ns) { should == :fb }
    its(:prefix) { should == 'fb:' }
  end

  context 'profile' do
    subject { Hotmeal::Namespace.for('http://ogp.me/ns/profile#') }

    it { should == 'profile: http://ogp.me/ns/profile#' }
    its(:uri) { should == 'http://ogp.me/ns/profile#' }
    its(:ns) { should == :profile }
    its(:prefix) { should == 'profile:' }
  end
end

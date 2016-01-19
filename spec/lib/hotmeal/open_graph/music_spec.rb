require 'spec_helper'

RSpec.describe Hotmeal::OpenGraph::Music do
end

RSpec.describe Hotmeal::OpenGraph::Music::Song do
  describe 'class' do
    subject { described_class }

    its(:property_class) { should == 'music.song' }
    its(:prefix) { should == 'music:' }
  end
end

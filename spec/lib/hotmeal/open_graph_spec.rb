require 'spec_helper'

describe Hotmeal::OpenGraph do
  let(:html) { fixture(:open_graph) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  it { should respond_to(:open_graph) }
  it { should respond_to(:og) }

  its(:title) { should == 'The Rock' }

  describe Hotmeal::OpenGraph::GraphObject do
    subject { hotmeal.og }

    its(:properties) do
      should == {
        title: 'The Rock',
        type: 'video.movie',
        url: 'http://www.imdb.com/title/tt0117500/',
        image: 'http://ia.media-imdb.com/images/rock.jpg',
        description: 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.',
      }
    end

    its(:title) { should == 'The Rock' }
    its(:type) { should == 'video.movie' }
    its(:url) { should == 'http://www.imdb.com/title/tt0117500/' }
    its(:image) { should == 'http://ia.media-imdb.com/images/rock.jpg' }
    its(:description) { should == 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.' }
  end

  its(:title) { should == 'The Rock' }
  its(:description) { should == 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.' }
end

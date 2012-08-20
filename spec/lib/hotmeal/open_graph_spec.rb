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

    context 'object types' do
      {
        music: %w(song album playlist radio_station),
        video: %w(movie episode tv_show other),
        nil => %w(article book profile website)
      }.each do |ns, names|
        if ns
          it { should respond_to("#{ns}?") }
          names.each do |name|
            it { should respond_to("#{ns}_#{name}?") }
          end
        else
          names.each do |name|
            it { should respond_to("#{name}?") }
          end
        end
      end
    end

    context 'structured properties' do
      it { should respond_to(:image) }
      it { should respond_to(:image_url) }
      it { should respond_to(:image_secure_url) }
      it { should respond_to(:image_type) }
      it { should respond_to(:image_width) }
      it { should respond_to(:image_height) }
    end
  end

  its(:title) { should == 'The Rock' }
  its(:description) { should == 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.' }
end

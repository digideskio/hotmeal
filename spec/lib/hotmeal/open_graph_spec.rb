require 'spec_helper'

describe Hotmeal::OpenGraph do
  describe 'document' do
    let(:html) { fixture(:open_graph) }
    subject(:document) { Hotmeal::Document.new(html) }

    it { should respond_to(:open_graph) }

    its(:title) { should == 'The Rock' }
    its(:description) { should == 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.' }

    describe Hotmeal::OpenGraph do
      subject(:og) { document.open_graph }

      its(:og_properties) do
        should == [
          ['og:title', 'The Rock'],
          %w(og:type video.movie),
          %w(og:url http://www.imdb.com/title/tt0117500/),
          %w(og:image http://ia.media-imdb.com/images/rock.jpg),
          ['og:description', 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.']
        ]
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

      it { should respond_to(:image) }
      context 'structured properties#image' do
        subject(:image) do
          # pending 'structured properties are not implemented'
          og.image
        end

        it { should respond_to(:url) }
        it { should respond_to(:secure_url) }
        it { should respond_to(:type) }
        it { should respond_to(:width) }
        it { should respond_to(:height) }
      end
    end
  end
end

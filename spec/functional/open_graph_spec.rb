require 'spec_helper'

RSpec.describe 'open_graph.html', type: :functional do
  let(:fixture_name) { :open_graph }

  its(:title) { should == 'The Rock' }
  its(:description) { should == 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.' }

  its(:html_prefix) do
    should == {
      'http://ogp.me/ns#' => 'og',
      'http://www.facebook.com/2008/fbml' => 'fb'
    }
  end
  its(:to_html) { should == html }

  describe :head do
    subject(:head) { document.head }
    its(:title) { should == 'The Rock (1996)' }
    its(:base_uri) { should == nil }

    describe :meta do
      subject(:meta) { head.meta }

      its(:size) { should == 9 }
      its('name.size') { should == 1 }
      its('http_equiv.size') { should == 1 }
      its('property.size') { should == 7 }
    end

    describe :links do
      subject(:links) { head.links }

      it { should be_a(Hotmeal::Html::Links)}

      describe :first do
        subject(:link) { links.first }

        it { should be_a(Hotmeal::Html::Link) }

        its(:rel) { should == 'alternate' }
        its(:href) { should == 'basic.html' }
      end
    end
  end

  describe :open_graph do
    subject(:open_graph) { document.open_graph }

    its(:og_properties) do
      should == [
        ['og:title', 'The Rock'],
        %w(og:type video.movie),
        %w(og:url http://www.imdb.com/title/tt0117500/),
        %w(og:image http://ia.media-imdb.com/images/rock.jpg),
        %w(og:image:secure_url https://ia.media-imdb.com/images/rock.jpg),
        ['og:description', 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.'],
        %w(fb:app_id 123456)
      ]
    end

    its(:to_hash) do
      should == {
        title: 'The Rock',
        type: 'video.movie',
        url: 'http://www.imdb.com/title/tt0117500/',
        image: 'http://ia.media-imdb.com/images/rock.jpg',
        description: 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.',
        app_id: '123456'
      }
    end

    its(:title) { should == 'The Rock' }
    its(:type) { should == 'video.movie' }
    its(:url) { should == 'http://www.imdb.com/title/tt0117500/' }
    describe :image do
      subject(:image) { open_graph.image }

      it { should == 'http://ia.media-imdb.com/images/rock.jpg' }
      its(:secure_url) { should == 'https://ia.media-imdb.com/images/rock.jpg' }
    end
    its(:description) { should == 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.' }
  end
end

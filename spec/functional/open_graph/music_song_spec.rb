require 'spec_helper'

RSpec.describe 'open_graph/music_song.html', type: :functional do
  let(:fixture_name) { 'open_graph/music_song' }

  its(:open_graph?) { should == true }

  describe :open_graph do
    subject(:open_graph) { document.open_graph }

    its(:og_properties) do
      should == [
        %w(fb:app_id 302184056577324),
        %w(og:type music.song),
        %w(og:url http://example.com/music/song),
        ['og:title', 'Sample Song'],
        %w(og:image https://s-static.ak.fbcdn.net/images/devsite/attachment_blank.png),
        %w(music:album:url http://example.com/music/album),
        %w(music:preview_url:url http://example.com/music/song/preview)
      ]
    end

    its(:app_id) { should == '302184056577324' }
    its(:title) { should == 'Sample Song' }
    its(:type) { should == 'music.song' }
    its(:music?) { should be true }
    its(:music_song?) { should be true }
    its(:url) { should == 'http://example.com/music/song' }
    describe :image do
      subject(:image) { open_graph.image }

      it { should == 'https://s-static.ak.fbcdn.net/images/devsite/attachment_blank.png' }
      its(:url) { should == 'https://s-static.ak.fbcdn.net/images/devsite/attachment_blank.png' }
      its(:secure_url) { should == nil }
    end
    describe :song do
      subject(:song) { open_graph.song }

      it { should == 'http://example.com/music/album' }
      its(:url) { should == 'http://example.com/music/album' }
    end
    describe :album do
      subject(:album) { open_graph.album }

      it { should == 'http://example.com/music/album' }
      its(:url) { should == 'http://example.com/music/album' }
    end
  end
end

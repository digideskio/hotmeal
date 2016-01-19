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

    its(:to_hash) do
      should == {
        app_id: '302184056577324',
        type: 'music.song',
        url: 'http://example.com/music/song',
        title: 'Sample Song',
        images: ['https://s-static.ak.fbcdn.net/images/devsite/attachment_blank.png'],
        album: 'http://example.com/music/album',
      }
    end

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
  end
end

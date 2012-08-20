require 'spec_helper'

describe Hotmeal::Meta do
  let(:html) { fixture(:basic) }
  let(:hotmeal) { Hotmeal::Base.new(html) }
  subject { hotmeal }

  it { should respond_to(:meta) }

  its(:keywords)    { should == %w(HTML Basic keyword another) }
  its(:description) { should == %(This is a basic HTML file.) }

  describe Hotmeal::Meta::MetaData do
    subject { hotmeal.meta }

    its(:charset)  { should == 'utf-8' }

    its(:data) do
      should == {
        keywords:    %(HTML, Basic, keyword, another),
        description: %(This is a basic HTML file.)
      }
    end

    its(:keywords)    { should == %w(HTML Basic keyword another) }
    its(:description) { should == %(This is a basic HTML file.) }

    context '#properties' do
      let(:html) { fixture(:open_graph) }

      its(:properties) do
        should == {
          'og:title'  => 'The Rock',
          'og:type'   => 'video.movie',
          'og:url'    => 'http://www.imdb.com/title/tt0117500/',
          'og:image'  => 'http://ia.media-imdb.com/images/rock.jpg',
          'og:description' => 'A renegade general and his group of U.S. Marines take over Alcatraz and threaten San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock attempt to prevent chaos.',
        }
      end
    end
  end
end

require 'spec_helper'

RSpec.describe Hotmeal::Html::Document do
  let(:html) { fixture(:open_graph) }
  subject(:document) do
    Hotmeal::Html::Document.new(html).tap do |doc|
      # Preload charset by Nokogiri
      doc.head.meta.charset
    end
  end
  it { should respond_to(:body) }

  describe :head do
    subject(:head) { document.head }
    its(:title) { should == 'The Rock (1996)' }

    it { should be_a(Hotmeal::Html::Head) }

    describe :meta do
      subject(:meta) { head.meta }

      it { should be_a(Hotmeal::Html::MetaData)}
      its(:size) { should == 9 }
      its(:charset) { should == 'utf-8' }
      its(:name) { should be_a(Enumerable) }

      describe :name do
        subject(:name) { meta.name }

        it { should be_a(Enumerable) }
        its(:size) { should == 1 }
      end

      describe :http_equiv do
        subject(:http_equiv) { meta.http_equiv }

        it { should be_a(Enumerable) }
        its(:size) { should == 1 }
      end

      describe :property do
        subject(:property) { meta.property }

        it { should be_a(Enumerable) }

        its(:size) { should == 6 }
      end

      describe Hotmeal::Html::Meta do
        subject { meta.first }

        it { should be_a(Hotmeal::Html::Meta) }
        it { should respond_to?(:name) }
        it { should respond_to?(:charset) }
        it { should respond_to?(:content) }
        it { should respond_to?(:property) }
      end
    end

    describe :links do
      subject(:links) { head.links }

      it { should be_a(Hotmeal::Html::Links)}

      describe Hotmeal::Html::Links do
        subject(:link) { links.first }

        it { should be_a(Hotmeal::Html::Link) }
        it { should respond_to(:rel) }
        it { should respond_to(:href) }

        its(:rel) { should == 'alternate' }
        its(:href) { should == 'basic.html' }
      end
    end
  end
end

RSpec.describe Hotmeal::Html::Head do
  it { should respond_to(:title) }
  it { should respond_to(:meta) }
  it { should respond_to(:links) }
end

RSpec.describe Hotmeal::Html::Meta do
  it { should respond_to(:charset) }
  it { should respond_to(:name) }
  it { should respond_to(:property) }
  it { should respond_to(:content) }
  it { should respond_to(:http_equiv) }
end

RSpec.describe Hotmeal::Html::Link do
  it { should respond_to(:rel) }
  it { should respond_to(:href) }
  it { should respond_to(:hreflang) }
  it { should respond_to(:media) }
  it { should respond_to(:sizes) }
  it { should respond_to(:type) }
end
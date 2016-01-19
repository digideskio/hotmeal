require 'spec_helper'

RSpec.describe 'basic.html', type: :functional do
  let(:fixture_name) { :basic }

  its(:document_title) { should == 'HTML file' }
  its(:title) { should == 'HTML file' }
  its(:html_prefix) { should == {} }

  its(:meta_charset) { should == 'utf-8' }
  its(:keywords) { should == %w(HTML Basic keyword another) }
  its(:description) { should == 'This is a basic HTML file.' }

  describe 'body' do
    subject(:body) { document.body }

    its(:inner_text) { should == 'HTML file' }
    its(:inner_html) { should == '<h1>HTML file</h1>' }
  end

  describe 'meta' do
    subject(:meta) { document.meta }

    its(:charset) { should == 'utf-8' }

    describe 'name' do
      subject(:name) { meta.name }

      its(:keywords) { should == ['HTML, Basic, keyword, another'] }
      its(:description) { should == ['This is a basic HTML file.'] }
    end
    its(:keywords) { should == %w(HTML Basic keyword another) }
    its(:description) { should == 'This is a basic HTML file.' }

    context 'properties' do
      let(:html) { fixture(:open_graph) }
      subject(:properties) { meta.properties }

      it { should have_key('og:title') }
      it { should have_key('og:type') }
      it { should have_key('og:url') }
      it { should have_key('og:image') }
      it { should have_key('og:description') }
    end
  end
end

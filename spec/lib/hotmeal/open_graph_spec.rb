require 'spec_helper'

RSpec.describe Hotmeal::Html::OpenGraph do
  let(:html) { fixture(:open_graph) }
  let(:document) { Hotmeal::Document.new(html) }
  subject(:open_graph) { document.open_graph }

  context 'object types' do
    {
      music: %w(song album playlist radio_station),
      video: %w(movie episode tv_show other),
      nil => %w(article book profile website)
    }.each do |ns, names|
      if ns
        pending { should respond_to("#{ns}?") }
        names.each { |name| pending { should respond_to("#{ns}_#{name}?") } }
      else
        names.each { |name| pending { should respond_to("#{name}?") } }
      end
    end
  end

  it { should respond_to(:image) }
  context 'structured properties#image' do
    subject(:image) { open_graph.image }

    it { should respond_to(:url) }
    it { should respond_to(:secure_url) }
    it { should respond_to(:type) }
    it { should respond_to(:width) }
    it { should respond_to(:height) }
  end
end

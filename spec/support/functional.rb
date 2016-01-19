RSpec.shared_context 'Functional Test', type: :functional do
  let(:html) { fixture(fixture_name) }
  subject(:document) { Hotmeal::Document.new(html) }
end

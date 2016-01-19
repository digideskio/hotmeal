RSpec.shared_context 'Collection Decorator', type: :collection do
  it { should respond_to(:first) }
  it { should respond_to(:last) }
  it { should respond_to(:size) }
  it { should respond_to(:each) }
end

require 'spec_helper'

RSpec.describe Hotmeal::Mapper::Document do
  it { should respond_to(:head) }
  it { should respond_to(:body) }
end

RSpec.describe Hotmeal::Mapper::Head do
  it { should respond_to(:title) }
  it { should respond_to(:meta) }
  it { should respond_to(:links) }
end

RSpec.describe Hotmeal::Mapper::Meta do
  it { should respond_to(:charset) }
  it { should respond_to(:name) }
  it { should respond_to(:property) }
  it { should respond_to(:content) }
  it { should respond_to(:http_equiv) }
end

RSpec.describe Hotmeal::Mapper::Link do
  it { should respond_to(:rel) }
  it { should respond_to(:href) }
  it { should respond_to(:hreflang) }
  it { should respond_to(:media) }
  it { should respond_to(:sizes) }
  it { should respond_to(:type) }
end

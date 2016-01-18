require 'spec_helper'

RSpec.describe Hotmeal::Html::Link do
  it { should respond_to(:rel) }
  it { should respond_to(:href) }
  it { should respond_to(:hreflang) }
  it { should respond_to(:media) }
  it { should respond_to(:sizes) }
  it { should respond_to(:type) }
end

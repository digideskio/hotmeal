SPEC_ROOT = File.expand_path('../..', __FILE__)
require 'bundler/setup'
require 'rspec'
require 'rspec/its'
require 'hotmeal'

Dir[File.join(SPEC_ROOT, 'spec/support/**/*.rb')].each {|f| require f}

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.mock_with :rspec
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end

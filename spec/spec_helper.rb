SPEC_ROOT = File.expand_path('../..', __FILE__)
require 'bundler/setup'
require 'rspec'
require 'rspec/its'
require 'hotmeal'

require 'support/fixtures'
require 'support/functional'
require 'support/collection_decorator'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = [:expect, :should]
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

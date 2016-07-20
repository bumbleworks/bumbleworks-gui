require 'simplecov'
SimpleCov.start

require 'capybara/rspec'
require 'bumbleworks/gui'
require_relative 'support/drivers/window_driver'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# To simulate the suggested use of mounting the GUI at a path
# below root, we'll mount it for tests at /bw
Capybara.app = Rack::Builder.new do
  map "/bw" do
    run Bumbleworks::Gui::RackApp
  end
end

require_relative 'fixtures/bumbleworks_config.rb'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'

  config.before(:suite) do
    Bumbleworks.start_worker!
  end

  config.before(:each) do
    Bumbleworks.kill_all_processes!
  end

  config.after(:suite) do
    Bumbleworks::Worker.shutdown_all
  end

  config.include PathHelpers
end

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

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before(:suite, :type => :features) do
    Bumbleworks.start_worker!
  end

  config.after(:suite, :type => :features) do
    Bumbleworks::Worker.shutdown_all
  end

  config.include PathHelpers
end

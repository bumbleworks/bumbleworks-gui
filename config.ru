ENV['RORY_STAGE'] ||= ENV['RACK_ENV'] || 'development'

require 'bumbleworks/gui'

require File.expand_path(File.join('spec', 'fixtures', 'bumbleworks_config.rb'))
require File.expand_path(File.join('spec', 'support', 'process_testing_helpers.rb'))

Bumbleworks.start_worker!

tp = Bumbleworks.launch!('test_process')

wait_until { tp.trackers.count == 1 }

puts Bumbleworks.dashboard.ps

run Bumbleworks::Gui::RackApp

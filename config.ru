ENV['RORY_STAGE'] ||= ENV['RACK_ENV'] || 'development'

require 'bumbleworks/gui'

require File.expand_path(File.join('spec', 'fixtures', 'bumbleworks_config.rb'))
require File.expand_path(File.join('spec', 'support', 'process_testing_helpers.rb'))

Bumbleworks.start_worker!

tp = Bumbleworks.launch!('task_process', :entity => Widget.new(54))
wp = Bumbleworks.launch!('waiting_process')

wait_until { wp.trackers.count == 4 }

Bumbleworks::Task.first.complete

run Bumbleworks::Gui::RackApp

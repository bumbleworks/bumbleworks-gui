ENV['RORY_ENV'] ||= ENV['RACK_ENV'] || 'development'

require 'bumbleworks/gui'

require File.expand_path(File.join('spec', 'fixtures', 'bumbleworks_config.rb'))
require File.expand_path(File.join('spec', 'support', 'process_testing_helpers.rb'))

Bumbleworks.start_worker!

Widget.truncate!
WidgetyFidget.truncate!

widget_processes = 45.times.collect do |i|
  Widget.new(i).launch_process('task_process')
end

5.times do |i|
  WidgetyFidget.new(i)
end

wp = Bumbleworks.launch!('waiting_process')

wait_until(:timeout => 30) { wp.reload.trackers.count == 4 }

widget_processes.first(3).each do |p|
  p.tasks.each do |t|
    t.complete
  end
end

if ENV['MOUNT_AT']
  app = Rack::Builder.new do
    map ENV['MOUNT_AT'] do
      run Bumbleworks::Gui::RackApp
    end
  end
  run app
else
  run Bumbleworks::Gui::RackApp
end


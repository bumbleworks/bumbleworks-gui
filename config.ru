ENV['RORY_STAGE'] ||= ENV['RACK_ENV'] || 'development'

require 'bumbleworks'
require 'bumbleworks/gui'

Bumbleworks.configure do |c|
  c.storage = {}
end

Bumbleworks.start_worker!

Bumbleworks.define_process 'warts' do
  people :task => 'be_funny'
end

Bumbleworks.launch!('warts')
Bumbleworks.dashboard.wait_for(:people)

puts Bumbleworks.dashboard.ps

run Bumbleworks::Gui::RackApp

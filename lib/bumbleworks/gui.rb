require "rory"
require "bumbleworks/gui/version"

module Bumbleworks
  module Gui
  end
end

require_relative "gui/config/application"
Bumbleworks::Gui::Application.root = File.join(File.dirname(__FILE__), 'gui')
Bumbleworks::Gui::Application.autoload_all_files

Bumblething = Rack::Builder.new {
  run Bumbleworks::Gui::Application.instance
  map '/assets' do
    run Rack::File.new(File.join(File.dirname(__FILE__), 'gui', 'config'))
  end
}
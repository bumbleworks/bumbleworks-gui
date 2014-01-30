require "rory"
require "rack"
require 'bumbleworks'
require "bumbleworks/gui/version"
require 'json'
Rufus::Json.detect_backend

module Bumbleworks
  module Gui
  end
end

require_relative "gui/config/application"
Bumbleworks::Gui::Application.root = File.join(File.dirname(__FILE__), 'gui')
Bumbleworks::Gui::Application.autoload_all_files

Bumbleworks::Gui::RackApp = Rack::Builder.new {
  run Bumbleworks::Gui::Application.instance
  map '/assets' do
    run Rack::File.new(File.join(File.dirname(__FILE__), 'gui', 'assets'))
  end
}
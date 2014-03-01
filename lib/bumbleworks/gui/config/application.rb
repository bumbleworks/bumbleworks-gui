module Bumbleworks
  module Gui
    class Application < Rory::Application
    end
  end
end

Bumbleworks::Gui::Application.root = File.expand_path('..', File.dirname(__FILE__))
Bumbleworks::Gui::Application.autoload_all_files

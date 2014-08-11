module Bumbleworks
  module Gui
    class Application < Rory::Application
    end
  end
end

Bumbleworks::Gui::Application.root = File.expand_path('..', File.dirname(__FILE__))
Bumbleworks::Gui::Application.auto_require_paths << 'lib'
Bumbleworks::Gui::Application.require_all_files

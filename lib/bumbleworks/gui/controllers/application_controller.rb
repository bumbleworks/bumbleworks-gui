module Bumbleworks
  module Gui
    class ApplicationController < Rory::Controller
      def layout
        'default'
      end

      def before_action
        expose :title => Bumbleworks::Support.titleize(@route.controller)
      end
    end
  end
end
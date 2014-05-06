module Bumbleworks
  module Gui
    class ApplicationController < Rory::Controller
      before_action :set_title

      def layout
        'default'
      end

      def set_title
        expose :title => Bumbleworks::Support.titleize(@route.controller)
      end
    end
  end
end
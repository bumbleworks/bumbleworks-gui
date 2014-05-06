module Bumbleworks
  module Gui
    class DashboardsController < ApplicationController
      def show
        expose({
          :entity_classes => Bumbleworks.entity_classes,
          :recent_processes => Bumbleworks::Process.all(:reverse => true, :limit => 3),
          :recent_tasks => Bumbleworks::Task.first(3)
        })
      end

      def set_title
        expose :title => 'Dashboard'
      end
    end
  end
end
module Bumbleworks
  module Gui
    class TasksController < ApplicationController
      def index
        expose :tasks => Bumbleworks::Task.all
      end

      def show
        expose :task => Bumbleworks::Task.find_by_id(params[:id])
      end
    end
  end
end
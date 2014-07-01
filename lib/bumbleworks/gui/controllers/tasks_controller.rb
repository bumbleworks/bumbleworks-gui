module Bumbleworks
  module Gui
    class TasksController < ApplicationController
      def index
        expose :tasks => Bumbleworks::Task.all
      end

      def show
        expose :task => task
      end

      def claim
        if params[:action] == 'release'
          task.release
        else
          task.claim(params[:claimant])
        end
        redirect path_to('tasks_show', :id => task.id)
      end

      def complete
        task.complete
        redirect path_to('tasks_index')
      end

    private

      def task
        Bumbleworks::Task.find_by_id(params[:id])
      end
    end
  end
end
module Bumbleworks
  module Gui
    class WorkersController < ApplicationController
      def index
        Bumbleworks::Worker.refresh_worker_info
        expose :workers => Bumbleworks::Worker.info
      end

      def show
        Bumbleworks::Worker.refresh_worker_info
        expose :id => params[:id], :info => Bumbleworks::Worker.info[params[:id]]
      end

      def change_global_state
        new_state = params[:state]
        Bumbleworks::Worker.change_worker_state(new_state)
        redirect path_to('workers_index')
      end

      def purge_stale
        Bumbleworks::Worker.purge_stale_worker_info
        redirect path_to('workers_index')
      end
    end
  end
end
module Bumbleworks
  module Gui
    class ProcessesController < ApplicationController
      def index
        redirect path_to('processes_index', :page => 1) unless params[:page]
        expose :processes => Bumbleworks::Process.all(:limit => 10, :offset => (params[:page].to_i - 1) * 10),
          :current_page => params[:page]
      end

      def show
        return render_not_found("Process `#{params[:pid]}` not found.") unless process && !process.expressions.empty?
        expose :process => process
      end

      private

      def process
        @process ||= Bumbleworks::Process.new(params[:pid])
      end
    end
  end
end

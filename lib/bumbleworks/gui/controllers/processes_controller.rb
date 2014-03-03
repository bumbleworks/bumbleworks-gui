module Bumbleworks
  module Gui
    class ProcessesController < ApplicationController
      def index
        expose :processes => Bumbleworks::Process.all
      end

      def show
        expose :process => Bumbleworks::Process.new(params[:id])
      end
    end
  end
end
module Bumbleworks
  module Gui
    class TrackersController < ApplicationController
      def index
        expose :trackers => Bumbleworks::Tracker.all
      end

      def show
        expose :tracker => Bumbleworks::Tracker.new(params[:id])
      end
    end
  end
end
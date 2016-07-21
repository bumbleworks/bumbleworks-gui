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

      def present
        super
      rescue Exception => exception
        render_exception exception
      end

      private

      def render_exception(exception)
        @response = [500, { 'Content-type' => 'text/html' }, ["Encountered an error: #{exception}"]]
      end

      def render_not_found(message = nil)
        message ||= 'Four, oh, four.'
        @response = [ 404, { 'Content-type' => 'text/html' }, [message] ]
      end
    end
  end
end

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
      rescue StandardError => exception
        is_dev_env? ? raise(exception) : render_exception(exception)
      end

      private

      def is_dev_env?
        (ENV['RF_ENV'] || ENV['RAILS_ENV'] || ENV['RORY_ENV'] || '') =~ /development/
      end

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

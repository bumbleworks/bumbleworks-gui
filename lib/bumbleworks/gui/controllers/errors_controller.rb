module Bumbleworks
  module Gui
    class ErrorsController < ApplicationController
      def index
        expose :errors => Bumbleworks.errors
      end

      def show
        expose :expression => expression, :process => process, :error => error
      end

      def replay
        error.replay
        redirect path_to('expressions_show', :pid => process.id, :id => expression.expid)
      end

    private

      def expression
        process.expression_at_position(params[:id])
      end

      def error
        expression.error
      end

      def process
        Bumbleworks::Process.new(params[:pid])
      end
    end
  end
end
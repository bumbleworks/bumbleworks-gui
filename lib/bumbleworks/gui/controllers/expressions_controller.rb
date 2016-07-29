module Bumbleworks
  module Gui
    class ExpressionsController < ApplicationController
      def show
        return render_not_found(error_message) unless expression
        expose :expression => expression, :process => process
      end

      def cancel
        if params[:action] == 'kill'
          expression.kill!
        else
          expression.cancel!
        end
        redirect path_to('processes_show', :id => process.id)
      end

    private

      def error_message
        "Expression `#{params[:id]}` for process `#{params[:pid]}` not found"
      end

      def expression
        @expression ||= process.expression_at_position(params[:id])
      end

      def process
        @process ||= Bumbleworks::Process.new(params[:pid])
      end
    end
  end
end

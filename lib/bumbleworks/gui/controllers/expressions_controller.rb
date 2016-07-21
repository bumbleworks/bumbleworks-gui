module Bumbleworks
  module Gui
    class ExpressionsController < ApplicationController
      def show
        return render_not_found unless expression
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

      def expression
        @expression ||= process.expression_at_position(params[:id])
      end

      def process
        Bumbleworks::Process.new(params[:pid])
      end
    end
  end
end

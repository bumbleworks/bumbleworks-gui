module Bumbleworks
  module Gui
    class ExpressionsController < ApplicationController
      def show
        expose :expression => expression, :process => process
      end

      def cancel
        if params[:action] == 'kill'
          expression.kill!
        else
          expression.cancel!
        end
        redirect("/processes/#{process.id}")
      end

    private

      def expression
        process.expression_at_position(params[:id])
      end

      def process
        Bumbleworks::Process.new(params[:pid])
      end
    end
  end
end
class ExpressionsController < Rory::Controller
  def layout
    'default'
  end

  def show
    get_expression
  end

  def cancel
    get_expression
    Bumbleworks.dashboard.cancel_expression(@expression)
    redirect("/processes/#{@process.id}")
  end

  def get_expression
    @process = Bumbleworks::Process.new(@params[:pid])
    @expression = @process.expressions.detect { |exp| exp.fei.expid == @params[:id] }
  end
end
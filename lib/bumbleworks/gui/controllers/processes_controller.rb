class ProcessesController < Rory::Controller
  def layout
    'default'
  end

  def index
    @processes = Bumbleworks::Process.all
  end

  def show
    @process = Bumbleworks::Process.new(@params[:id])
  end
end
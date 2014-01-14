class ProcessesController < Rory::Controller
  def layout
    'default'
  end

  def index
    @processes = Bumbleworks.dashboard.process_wfids.map do |ps|
      Bumbleworks::Process.new(ps)
    end
  end

  def show
    @process = Bumbleworks::Process.new(@params[:id])
  end
end
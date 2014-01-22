class DashboardsController < Rory::Controller
  def layout
    'default'
  end

  def index
    @processes = Bumbleworks::Process.all
    @trackers = Bumbleworks::Tracker.all
    @tasks = Bumbleworks::Task.all
  end
end

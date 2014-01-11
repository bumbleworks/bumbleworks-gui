class DashboardsController < Rory::Controller
  def layout
    'default'
  end

  def index
    @ps = Bumbleworks.dashboard.ps
  end

  def trackers
    @trackers = Bumbleworks.dashboard.get_trackers.values
  end
end
class DashboardsController < Rory::Controller
  def layout
    'default'
  end

  def index
    @ps = Bumbleworks.dashboard.ps
  end
end
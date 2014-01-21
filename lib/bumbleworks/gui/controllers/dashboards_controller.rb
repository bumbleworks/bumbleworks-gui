class DashboardsController < Rory::Controller
  def layout
    'default'
  end

  def index
    @processes = Bumbleworks.dashboard.process_wfids.map do |ps|
      Bumbleworks::Process.new(ps)
    end
    @trackers = Bumbleworks.dashboard.get_trackers.map do |tid, attrs|
      Bumbleworks::Tracker.new(tid, attrs)
    end
    @tasks = Bumbleworks::Task.all
  end
end

class TrackersController < Rory::Controller
  def layout
    'default'
  end

  def index
    @trackers = Bumbleworks.dashboard.get_trackers.map do |tid, attrs|
      Bumbleworks::Tracker.new(tid, attrs)
    end
  end

  def show
    @tracker = Bumbleworks::Tracker.new(@params[:id])
  end
end
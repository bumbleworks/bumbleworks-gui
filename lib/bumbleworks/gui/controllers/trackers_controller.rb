class TrackersController < Rory::Controller
  def layout
    'default'
  end

  def index
    @trackers = Bumbleworks::Tracker.all
  end

  def show
    @tracker = Bumbleworks::Tracker.new(@params[:id])
  end
end
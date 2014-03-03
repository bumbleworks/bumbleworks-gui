class TrackerIndex < WindowDriver
  def has_tracker?(tracker)
    page.has_text?(tracker.id)
  end

  def has_trackers?(trackers)
    trackers.all? do |tracker|
      has_tracker?(tracker)
    end
  end
end
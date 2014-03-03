class TrackerDetail < WindowDriver
  def has_tracker?(tracker)
    page.has_text?(tracker.original_hash.to_s)
  end
end
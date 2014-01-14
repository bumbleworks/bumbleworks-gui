class TrackerDetail
  def initialize(session)
    @session = session
  end

  def page
    @session.page
  end

  def has_tracker?(tracker)
    page.has_text?(tracker.original_hash.to_s)
  end
end
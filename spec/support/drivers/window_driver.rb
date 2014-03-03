class WindowDriver
  def initialize(session)
    @session = session
  end

  def page
    @session.page
  end
end
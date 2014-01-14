class ProcessDetail
  def initialize(session)
    @session = session
  end

  def page
    @session.page
  end

  def has_process?(process)
    page.has_text?(process.wfid)
  end
end
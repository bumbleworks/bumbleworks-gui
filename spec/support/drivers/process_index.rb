class ProcessIndex
  def initialize(session)
    @session = session
  end

  def page
    @session.page
  end

  def has_process?(process)
    page.has_text?(process.wfid)
  end

  def has_processes?(processes)
    processes.all? do |process|
      has_process?(process)
    end
  end
end
class ProcessIndex < WindowDriver
  def has_process?(process)
    page.has_text?(process.wfid) && page.has_text?(process.entity_name)
  end

  def has_processes?(processes)
    processes.all? do |process|
      has_process?(process)
    end
  end
end
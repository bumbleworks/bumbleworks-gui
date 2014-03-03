class ProcessDetail < WindowDriver
  def has_process?(process)
    page.has_text?(process.wfid)
  end

  def has_entity?(entity)
    page.has_text?(entity)
  end

  def has_error?(error)
    page.has_text?(error.message)
  end

  def has_expression?(exp)
    page.has_text?(exp.expid)
  end
end
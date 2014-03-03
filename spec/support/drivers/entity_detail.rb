class EntityDetail < WindowDriver
  def has_entity?(entity)
    page.has_text?(entity.to_s)
  end

  def has_process?(process)
    page.has_text?(process.wfid)
  end
end
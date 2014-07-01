class TaskDetail < WindowDriver
  def has_task?(task)
    page.has_text?(task.id)
  end

  def has_claimant?(claimant)
    page.first('.claimant').has_text?(claimant)
  end
end
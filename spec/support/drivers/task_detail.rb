class TaskDetail < WindowDriver
  def has_task?(task)
    page.has_text?(task.id)
  end
end
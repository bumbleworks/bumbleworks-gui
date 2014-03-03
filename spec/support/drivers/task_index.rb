class TaskIndex < WindowDriver
  def has_task?(task)
    page.has_text?(task.id)
  end

  def has_tasks?(tasks)
    tasks.all? do |task|
      has_task?(task)
    end
  end
end
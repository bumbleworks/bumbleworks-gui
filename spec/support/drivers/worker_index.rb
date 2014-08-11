class WorkerIndex < WindowDriver
  def has_worker?(worker)
    page.has_text?(worker.id)
  end

  def has_workers?(workers)
    workers.all? do |worker|
      has_worker?(worker)
    end
  end
end
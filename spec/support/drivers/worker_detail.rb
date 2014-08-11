class WorkerDetail < WindowDriver
  def has_worker?(worker)
    page.has_text?(worker.id)
  end
end
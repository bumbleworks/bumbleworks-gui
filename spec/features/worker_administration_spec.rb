feature "Worker management" do
  let(:worker_index) { WorkerIndex.new(Capybara) }
  let(:worker_detail) { WorkerDetail.new(Capybara) }

  scenario "Admin views worker index" do
    worker1 = Bumbleworks.start_worker!
    worker2 = Bumbleworks.start_worker!

    visit_scoped '/workers'

    expect(worker_index).to have_workers([Bumbleworks.dashboard.worker, worker1, worker2])
  end

  scenario "Admin views worker detail" do
    worker = Bumbleworks.start_worker!

    visit_scoped "/workers/#{worker.id}"

    expect(worker_detail).to have_worker(worker)
  end

  scenario "Admin pauses all workers" do
    worker1 = Bumbleworks.start_worker!
    worker2 = Bumbleworks.start_worker!

    visit_scoped "/workers"
    click_button :pause
    expect(page).not_to have_text('running')
    expect(page).to have_text('paused')
  end

  scenario "Admin purges stale worker info" do
    worker1 = Bumbleworks.start_worker!
    worker2 = Bumbleworks.start_worker!

    visit_scoped "/workers"
    click_button :stop
    click_button :purge
    expect(worker_index).not_to have_workers([worker1, worker2])
  end
end
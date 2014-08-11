feature "Worker management" do
  let(:worker_index) { WorkerIndex.new(Capybara) }
  let(:worker_detail) { WorkerDetail.new(Capybara) }

  scenario "Admin views worker index" do
    other_worker = Bumbleworks.start_worker!

    visit_scoped '/workers'

    expect(worker_index).to have_workers([Bumbleworks.dashboard.worker, other_worker])

    other_worker.shutdown
  end

  scenario "Admin views worker detail" do
    visit_scoped "/workers/#{Bumbleworks.dashboard.worker.id}"

    expect(worker_detail).to have_worker(Bumbleworks.dashboard.worker)
  end

  scenario "Admin pauses all workers" do
    other_worker = Bumbleworks.start_worker!

    visit_scoped "/workers"
    click_button :pause
    expect(page).not_to have_text('running')
    expect(page).to have_text('paused')

    # return to single running worker
    click_button :unpause
    other_worker.shutdown
  end

  scenario "Admin purges stale worker info" do
    other_worker = Bumbleworks.start_worker!

    visit_scoped "/workers"
    click_button :shutdown
    click_button :purge
    expect(worker_index).not_to have_workers([Bumbleworks.dashboard.worker, other_worker])

    Bumbleworks.start_worker!
  end
end
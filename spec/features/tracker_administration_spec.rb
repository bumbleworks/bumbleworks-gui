feature "Tracker management" do
  let(:tracker_index) { TrackerIndex.new(Capybara) }
  let(:tracker_detail) { TrackerDetail.new(Capybara) }

  scenario "Admin views tracker index" do
    process1 = Bumbleworks.launch!('waiting_process')
    process2 = Bumbleworks.launch!('waiting_process')
    wait_until { process1.reload.trackers.count == 4 && process2.reload.trackers.count == 4 }
    visit_scoped '/trackers'

    expect(tracker_index).to have_trackers(process1.trackers + process2.trackers)
  end

  scenario "Admin views tracker detail" do
    process = Bumbleworks.launch!('waiting_process')
    wait_until { process.reload.trackers.count == 4 }
    tracker = process.trackers.first

    visit_scoped "/trackers/#{tracker.id}"

    expect(tracker_detail).to have_tracker(tracker)
  end
end
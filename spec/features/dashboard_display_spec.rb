feature "Dashboard display" do
  let(:dashboard_detail) { DashboardDetail.new(Capybara) }

  scenario "Admin views dashboard" do
    process1 = Bumbleworks.launch!('task_process')
    process2 = Bumbleworks.launch!('waiting_process')
    wait_until {
      process1.tasks.count == 2 &&
        process2.reload.trackers.count == 4
    }

    visit '/'

    expect(dashboard_detail).to have_count_of(Bumbleworks::Process.all)
    expect(dashboard_detail).to have_count_of(Bumbleworks::Task.all)
    expect(dashboard_detail).to have_count_of(Bumbleworks::Tracker.all)
  end
end
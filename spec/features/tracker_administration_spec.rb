feature "Tracker management" do
  before(:each) do
    Bumbleworks.start_worker!
    tp = Bumbleworks.launch!('test_process')
    wait_until { tp.trackers.count == 1 }
  end

  scenario "Admin views list of trackers" do    
    visit '/trackers'

    expect(page).to have_text("non_admin_stuff_done")
  end
end
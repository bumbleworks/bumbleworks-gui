feature "Process management" do
  let(:process_index) { ProcessIndex.new(Capybara) }
  let(:process_detail) { ProcessDetail.new(Capybara) }

  scenario "Admin views process index" do
    process1 = Bumbleworks.launch!('task_process')
    process2 = Bumbleworks.launch!('task_process')
    wait_until { process1.tasks.count == 1 && process2.tasks.count == 1 }

    visit '/processes'

    expect(process_index).to have_processes([process1, process2])
  end

  scenario "Admin views process detail" do
    process = Bumbleworks.launch!('task_process')
    wait_until { process.tasks.count == 1 }

    visit "/processes/#{process.id}"

    expect(process_detail).to have_process(process)
  end
end
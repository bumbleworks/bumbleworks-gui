feature "Task management" do
  let(:task_index) { TaskIndex.new(Capybara) }
  let(:task_detail) { TaskDetail.new(Capybara) }

  scenario "Admin views task index" do
    process = Bumbleworks.launch!('task_process')
    wait_until { process.tasks.count == 2 }

    visit_scoped '/tasks'

    expect(task_index).to have_tasks(process.tasks.all)
  end

  scenario "Admin views task detail" do
    process = Bumbleworks.launch!('task_process')
    task = process.tasks.next_available

    visit_scoped "/tasks/#{task.id}"

    expect(task_detail).to have_task(task)
  end

  scenario "Admin claims task for token" do
    process = Bumbleworks.launch!('task_process')
    task = process.tasks.next_available

    visit_scoped "/tasks/#{task.id}"
    fill_in :claimant, :with => 'frooge'
    click_button :claim

    expect(task_detail).to have_claimant('frooge')
  end

  scenario "Admin releases task" do
    process = Bumbleworks.launch!('task_process')
    task = process.tasks.next_available
    task.claim('togurram')

    visit_scoped "/tasks/#{task.id}"
    click_button :release

    expect(task_detail).not_to have_claimant('togurram')
  end

  scenario "Admin completes task" do
    process = Bumbleworks.launch!('task_process')
    task = process.tasks.next_available
    task.claim('togurram')

    visit_scoped "/tasks/#{task.id}"
    click_button :complete
    wait_until { process.tasks.count == 1 }

    visit_scoped '/tasks'
    expect(task_index).not_to have_task(task)
  end
end
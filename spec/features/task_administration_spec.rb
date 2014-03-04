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
end
feature "Error administration" do
  let(:error_index) { ErrorIndex.new(Capybara) }
  let(:expression_detail) { ExpressionDetail.new(Capybara) }
  let(:error_detail) { ErrorDetail.new(Capybara) }
  let(:process) {
    process = Bumbleworks.launch!('task_process')
    wait_until { process.reload.tasks.count == 2 }
    process
  }
  let(:error_expression) {
    process.tasks.each { |t| t.complete }
    wait_until(:timeout => 10) { process.reload.leaves.first.error }
    process.leaves.first
  }

  after(:each) do
    NaughtyParticipant.naughty_is_ok = false
  end

  scenario "Admin views error index" do
    process2 = Bumbleworks.launch!('task_process')
    wait_until { process2.reload.tasks.count == 2 }
    process2.tasks.each { |t| t.complete }
    error_expression

    visit_scoped "/errors"

    expect(error_index).to have_errors([error_expression.error, process2.errors.first])
  end

  scenario "Admin views error detail" do
    expression = error_expression

    visit_scoped "/processes/#{process.id}/expressions/#{expression.expid}/error"

    expect(error_detail).to have_error(expression.error)
  end

  scenario "Admin replays error" do
    expression = error_expression
    NaughtyParticipant.naughty_is_ok = true
    visit_scoped "/processes/#{process.id}/expressions/#{expression.expid}/error"
    click_button 'Replay'

    wait_until { process.reload.tasks.count == 1 }
    visit_scoped "/processes/#{process.id}"
    expect(expression_detail).not_to have_error(expression.error)
  end
end

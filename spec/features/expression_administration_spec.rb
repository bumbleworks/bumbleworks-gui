feature "Expression administration" do
  let(:expression_detail) { ExpressionDetail.new(Capybara) }
  let(:process_detail) { ProcessDetail.new(Capybara) }
  let(:process) {
    process = Bumbleworks.launch!('task_process')
    wait_until { process.reload.tasks.count == 2 }
    process
  }
  let(:error_expression) {
    process.tasks.each { |t| t.complete }
    wait_until { process.reload.leaves.first.error }
    process.leaves.first
  }

  scenario "Admin views expression" do
    expression = process.leaves.first

    visit "/processes/#{process.id}/expressions/#{expression.expid}"

    expect(expression_detail).to have_expression(expression)
  end

  scenario "Admin cancels expression" do
    expression = process.leaves.first

    visit "/processes/#{process.id}/expressions/#{expression.expid}"
    click_button 'Cancel'

    wait_until { process.reload.tasks.count == 1 }
    visit "/processes/#{process.id}"
    expect(process_detail).not_to have_expression(expression)
  end

  scenario "Admin kills expression" do
    visit "/processes/#{process.id}/expressions/#{error_expression.expid}"
    click_button 'Kill'

    wait_until { process.reload.errors.empty? }
    visit "/processes/#{process.id}"
    expect(process_detail).not_to have_error(NaughtyParticipant::StupidError.new("Oh crumb."))
  end

  scenario "Admin views expression errors" do
    visit "/processes/#{process.id}/expressions/#{error_expression.expid}"

    expect(expression_detail).to have_error(NaughtyParticipant::StupidError.new("Oh crumb."))
  end
end

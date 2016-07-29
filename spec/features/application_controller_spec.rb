feature "Application controller" do

  scenario "Handles error gracefully" do
    visit_scoped '/entities/bad'
    expect(page.body).to eq("Encountered an error: uninitialized constant Bad")
    expect(page.status_code).to eq(500)
  end
end

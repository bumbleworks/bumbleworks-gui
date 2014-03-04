feature "Entity management" do
  let(:entity_index) { EntityIndex.new(Capybara) }
  let(:entity_detail) { EntityDetail.new(Capybara) }
  let(:entity_type_index) { EntityTypeIndex.new(Capybara) }

  before(:each) do
    Widget.truncate!
    WidgetyFidget.truncate!
    @widgets = [Widget.new(12), Widget.new(38), Widget.new(5)]
    @widgety_fidgets = [WidgetyFidget.new(5), WidgetyFidget.new(3)]
  end

  scenario "Admin views entity index" do
    visit_scoped '/entities'

    expect(entity_index.entity_count('Widget')).to eq 3
    expect(entity_index.entity_count('Widgety Fidget')).to eq 2
  end

  scenario "Admin views index for entity type" do
    visit_scoped '/entities/widget'

    expect(entity_type_index).to have_entities(@widgets)
    expect(entity_type_index).not_to have_entities(@widgety_fidgets)
    expect(entity_type_index).to have_registered_process('task_process')
  end

  scenario "Admin views entity detail" do
    widget = @widgets.first
    process = widget.launch_process('task_process')
    wait_until { process.tasks.count == 2 }

    visit_scoped "/entities/widget/#{widget.identifier}"

    expect(entity_detail).to have_entity(widget)
    expect(entity_detail).to have_process(process)
  end
end
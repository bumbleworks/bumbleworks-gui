Bumbleworks.configure do |c|
  c.storage = {}
  c.root = File.dirname(__FILE__)
end

Bumbleworks.register_participants do
  # no participants yet
end
Bumbleworks.register_tasks
Bumbleworks.load_definitions!
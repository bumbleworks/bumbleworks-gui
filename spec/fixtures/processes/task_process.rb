Bumbleworks.define_process do
  admin :task => 'do_something'
  error 'Oh dear'
  peon :task => 'meekly_do_something'
  admin :task => 'confront'
end
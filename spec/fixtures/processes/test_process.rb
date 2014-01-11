Bumbleworks.define_process do
  wait_for_event :non_admin_stuff_done
  admin :task => 'do_stuff'
end

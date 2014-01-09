Bumbleworks::Gui::Application.set_routes do
  match '/trackers', :to => 'dashboards#trackers', :methods => [:get]
  match '/', :to => 'dashboards#index', :methods => [:get]
end
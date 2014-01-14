Bumbleworks::Gui::Application.set_routes do
  match '/trackers/:id', :to => 'trackers#show', :methods => [:get]
  match '/trackers', :to => 'trackers#index', :methods => [:get]
  match '/processes/:id', :to => 'processes#show', :methods => [:get]
  match '/processes', :to => 'processes#index', :methods => [:get]
end
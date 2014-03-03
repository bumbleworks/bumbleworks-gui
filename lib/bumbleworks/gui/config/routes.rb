Bumbleworks::Gui::Application.set_routes do
  scope :module => 'bumbleworks/gui' do
    match '/entities', :to => 'entities#types', :methods => [:get]
    match '/entities/:type', :to => 'entities#index', :methods => [:get]
    match '/entities/:type/:id', :to => 'entities#show', :methods => [:get]
    match '/trackers', :to => 'trackers#index', :methods => [:get]
    match '/trackers/:id', :to => 'trackers#show', :methods => [:get]
    match '/trackers', :to => 'trackers#index', :methods => [:get]
    match '/processes/:pid/expressions/:id', :to => 'expressions#show', :methods => [:get]
    match '/processes/:pid/expressions/:id/cancel', :to => 'expressions#cancel', :methods => [:delete]
    match '/processes/:pid/expressions/:id/kill', :to => 'expressions#kill', :methods => [:delete]
    match '/processes/:id', :to => 'processes#show', :methods => [:get]
    match '/processes', :to => 'processes#index', :methods => [:get]
    match '/tasks/:id', :to => 'tasks#show', :methods => [:get]
    match '/tasks', :to => 'tasks#index', :methods => [:get]
    match '/', :to => 'dashboards#show', :methods => [:get]
  end
end
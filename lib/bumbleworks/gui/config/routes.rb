Bumbleworks::Gui::Application.set_routes do
  scope :module => 'bumbleworks/gui' do
    match '/entities', :to => 'entities#types', :methods => [:get]
    match '/entities/:type', :to => 'entities#index', :methods => [:get]
    match '/entities/:type/:id', :to => 'entities#show', :methods => [:get]
    match '/trackers', :to => 'trackers#index', :methods => [:get]
    match '/trackers/:id', :to => 'trackers#show', :methods => [:get]
    match '/workers', :to => 'workers#index', :methods => [:get]
    match '/workers/command', :to => 'workers#change_global_state', :methods => [:put]
    match '/workers/purge', :to => 'workers#purge_stale', :methods => [:delete]
    match '/workers/:id', :to => 'workers#show', :methods => [:get]
    match '/processes/:pid/expressions/:id', :to => 'expressions#show', :methods => [:get]
    match '/processes/:pid/expressions/:id/cancel', :to => 'expressions#cancel', :methods => [:delete]
    match '/processes/:pid/expressions/:id/kill', :to => 'expressions#kill', :methods => [:delete]
    match '/processes/:id', :to => 'processes#show', :methods => [:get]
    match '/processes/page/:page', :to => 'processes#index', :methods => [:get]
    match '/processes', :to => 'processes#index', :methods => [:get]
    match '/tasks/:id', :to => 'tasks#show', :methods => [:get]
    match '/tasks', :to => 'tasks#index', :methods => [:get]
    match '/tasks/:id/claim', :to => 'tasks#claim', :methods => [:put]
    match '/tasks/:id/complete', :to => 'tasks#complete', :methods => [:put]
    match '/', :to => 'dashboards#show', :methods => [:get]
  end
end
# Bumbleworks::Gui

A rack-based web GUI (using [Rory](http://github.com/ravigadad/rory)) for your [Bumbleworks](http://github.com/bumbleworks/bumbleworks) instance.

## Installation

Add this line to your application's Gemfile:

    gem 'bumbleworks-gui'

## Usage

There are quite a few ways to use this - the most common, if you're using Bumbleworks in a Rails app, would probably be to mount Bumbleworks::Gui::Application at some path in your Rails routing - see the [Rails routing guide](http://guides.rubyonrails.org/routing.html#routing-to-rack-applications) for more info.

Or you could set up a separate server for it - basically, Bumbleworks just needs to be configured, and then Bumbleworks::Gui::Application run as a Rack app.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

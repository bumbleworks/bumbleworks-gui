# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bumbleworks/gui/version'

Gem::Specification.new do |spec|
  spec.name          = "bumbleworks-gui"
  spec.version       = Bumbleworks::Gui::VERSION
  spec.authors       = ["Ravi Gadad"]
  spec.email         = ["ravi@renewfund.com"]
  spec.description   = %q{Bumbleworks web GUI for viewing/administering processes}
  spec.summary       = %q{This gem enables a Rory application (mountable in your own app)
                          to make it easier to administer your Bumbleworks instance.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bumbleworks", ">= 0.0.87"
  spec.add_runtime_dependency "rory", ">= 0.3.11"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'shotgun'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'simplecov'
end

module Bumbleworks
  module Gui
    class Application < Rory::Application
      def call(env)
        [200, { 'Content-Type' => 'text/html' }, [Rack::Request.new(env).path_info, Rack::Request.new(env).inspect, super]]
      end
    end
  end
end
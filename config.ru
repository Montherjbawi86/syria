# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
app = proc do |env|
  [200, { 'Content-Type' => 'text/html' }, ['Hello from Ruby on Heroku!']]
end

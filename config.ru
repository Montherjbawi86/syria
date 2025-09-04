# Simple Rack application
app = proc do |env|
  [200, { 'Content-Type' => 'text/html' }, ['Hello from Ruby on Heroku!']]
end

run app

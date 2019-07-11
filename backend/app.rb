require 'sinatra'

if development?
  require 'sinatra/reloader'
  require 'dotenv/load'
  require 'pry'
end

set :port, ENV['SERVER_PORT']

# Validate request is coming from slack
before do
  return if ENV['RACK_ENV'] == 'test'

  timestamp = request.env['HTTP_X_SLACK_REQUEST_TIMESTAMP']
  slack_signature = request.env['HTTP_X_SLACK_SIGNATURE']
  body = request.body.read
  halt 403 unless timestamp && slack_signature

  version = slack_signature.split('=').first
  combined = "#{version}:#{timestamp}:#{body}"
  hash = OpenSSL::HMAC.hexdigest("SHA256", ENV['SLACK_SIGNING_SECRET'], combined)

  halt 403 unless "#{version}=#{hash}" == slack_signature
end

post '/time' do
  "The current time is: #{Time.now.strftime('%T %p')}"
end
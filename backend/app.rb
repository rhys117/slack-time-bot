require 'sinatra'
require 'dotenv/load'

if development?
  require 'sinatra/reloader'
  require 'pry'
end

set :port, ENV['SERVER_PORT']

post '/time' do
  Time.now.to_s
end
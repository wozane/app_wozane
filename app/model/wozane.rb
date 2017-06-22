require 'sinatra/base'
require 'bundler/setup'
require 'sprockets'

class Wozane < Sinatra::Base

  get '/' do
    "Welcome to wozane's world"
    erb :index
  end

  get '/coding' do
    'coding view'
    erb :coding
  end

  get '/yarn' do
    'yarn view'
    erb :yarn
  end

  get '/login' do
    erb :login
  end
end

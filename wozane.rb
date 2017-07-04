require 'sinatra/base'
require 'bundler/setup'

class Wozane < Sinatra::Base
  set :views, File.expand_path('../app/views', __FILE__)
  set :raise_errors, true

  enable :sessions

  get '/' do
    erb :index
  end

  get '/gallery' do
    erb :gallery
  end

  get '/blog' do
    erb :blog
  end

  get '/board' do
    erb :board
  end

  get '/shop' do
    erb :shop
  end

  get '/login' do
    redirect to('/')
  end

  get '/index' do
    redirect to('/')
  end

  error 404 do
    'Access forbidden'
  end

  get '/secret' do
    halt 401, 'go away!'
  end
end

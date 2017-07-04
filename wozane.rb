require 'sinatra/base'
require 'bundler/setup'

class Wozane < Sinatra::Base
  set :views, File.expand_path('../app/views', __FILE__)
  set :raise_errors, true
  set :show_exceptions, :after_handler

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

  # 404 error
  not_found do
    status 404
    erb :error
  end

  get '/secret' do
    halt 401, 'go away!'
  end
end

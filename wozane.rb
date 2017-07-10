require 'sinatra/base'
require 'sinatra/flash'
require 'bundler/setup'
require 'bcrypt'

Dir['./lib/**/*.rb'].each { |file| require file }

class Wozane < Sinatra::Base
  set :views, File.expand_path('../views', __FILE__)
  set :raise_errors, true
  set :show_exceptions, :after_handler

  enable :sessions
  register Sinatra::Flash

  get '/' do
    flash[:notice] = 'Hooray, Flash is working!'
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
    erb :login, locals: { title: 'Sign in' }
  end

  post '/login' do
    if Authenticator.authenticate?(params['username'], params['password'])
      session[:admin] = true
      redirect to('/admin')
    else
      flash[:alert] = 'Try again!'
      redirect to('/login')
    end
  end

  get '/admin' do
    erb :admin
  end

  get '/logout' do
    session[:admin] = false
    redirect to('/')
  end

  get '/index' do
    redirect to('/')
  end

  # error
  not_found do
    status 404
    erb :error
  end

  get '/secret' do
    halt 401, 'go away!'
  end
end

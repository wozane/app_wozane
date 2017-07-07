require 'sinatra/base'
require 'bundler/setup'
require 'bcrypt'

Dir["./lib/**/*.rb"].each{|file| require file}

def hash_password(password)
  BCrypt::Password.create(password).to_s
end

def test_password(password, hash)
  BCrypt::Password.new(hash) == password
end

User = Struct.new(:id, :username, :password_hash)
USERS = [
  User.new(1, 'bob', hash_password('poo')),
  User.new(2, 'sally', hash_password('go round the sun')),
]

class Wozane < Sinatra::Base
  set :views, File.expand_path('../views', __FILE__)
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
    erb :login, locals: { title: 'Sign in'}
  end

  post '/login' do
    user = USERS.find { |u| u.username == params[:username] }
    if user && test_password(params[:password], user.password_hash)
      session.clear
      session[:user_id] = user.id
      redirect '/admin'
    else
      erb :index
    end
  end

  post '/create_user' do
    USERS << User.new(
      USERS.size + 1, #id
      params[:username], #username
      hash_password(params[:password]) #password_hash
    )
    redirect '/'
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  helpers do
    def current_user
      if session[:user_id]
         USERS.find { |u| u.id == session[:user_id] }
      else
        nil
      end
    end
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

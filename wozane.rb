require 'sinatra/base'
require 'bundler/setup'
require 'sprockets'

class Wozane < Sinatra::Base
  set :views, File.expand_path('../app/views', __FILE__)

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

  get '/logon' do
    erb :logon
  end
end

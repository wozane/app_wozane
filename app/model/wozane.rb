require 'sinatra/base'
require 'bundler/setup'
require 'sprockets'

class Wozane < Sinatra::Base

  get '/' do
    "Welcome to wozane's world"
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

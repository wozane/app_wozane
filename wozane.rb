require "sinatra/base"
require "bundler/setup"

class Wozane < Sinatra::Base
  get "/" do
    "Welcome to wozane's world"
    erb :index
  end

  get "/shop" do
    "shop view"
  end

  get "/gallery" do
    "gallery view"
  end

  get "/blog" do
    "blog view"
  end

  get "/wozpin" do
    "wozane pintrest"
  end
end

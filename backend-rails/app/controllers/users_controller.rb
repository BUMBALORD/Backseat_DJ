class UsersController < ApplicationController

 Dotenv.load

 def index
      client = SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password'],
      :redirect_uri  => "http://localhost:3000/callback.html"
      # :redirect_uri => "google.com"

    })
      redirect_to client.authorize_url()
  end

  def auth
    client = SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password'],
      # :redirect_uri  => "http://localhost:3000/callback.html"
      # :redirect_uri => "/users"
    })
    code = params[:code]
    access_token = client.exchange_token(:code => code)
    # p access_token
    david = Soundcloud.new(:access_token => access_token.access_token)
    current_user = david.get('/me')
    # current_user = SoundCloud.new(:access_token => access_token).get('/me')
    # puts current_user.full_name
    # p access_token
    # call here to sound cloud with code to get his info as another params
    p "*" * 100
    p params
    p "*" * 100

   #NO RENDER after HTTParty?!?!?!??!?!
    # redirect_to "http://localhost:9393/users/1/playlists"
  end

  def new
    # User.find(params[:id])
  end

  def create
    user = User.create(user_name: params[:user_name], password: params[:password])
    p "*" * 100
    p params
    p user
    p "*" * 100
    # render json: user
    redirect_to root_path
  end

end

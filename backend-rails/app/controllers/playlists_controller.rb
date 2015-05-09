
class PlaylistsController < ApplicationController
Dotenv.load
  def index
    client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password'],
      :redirect_uri  => "http://localhost:3000/callback.html"
    })
    # @token = client.options.access_token
    # @rudown = HTTparty.get('http://connect.soundcloud.com/sdk.js')
      # @asdf = @client.get('/tracks')
       # @asdf = @asdf[0]
      # @bankz = []
      # @asdf = client.get('/tracks', :q => 'young thug')
      # @asdf.each do |xyz|
      #   @bankz << xyz.title
      # end
      # render :js => @bankz.to_json
      redirect_to client.authorize_url()
  end

  def auth
    client = SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password'],
      :redirect_uri  => "http://localhost:3000/callback.html"
    })
    code = params[:code]
    access_token = client.exchange_token(:code => code)
    p access_token
    david = Soundcloud.new(:access_token => access_token.access_token)
    current_user = david.get('/me')
    # current_user = SoundCloud.new(:access_token => access_token).get('/me')
    # puts current_user.full_name
    # p access_token
    # call here to sound cloud with code to get his info as another params
    # redirect_to 'https://soundcloud.com/connect'



  end


end

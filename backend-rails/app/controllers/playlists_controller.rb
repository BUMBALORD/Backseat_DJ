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


  def new
    client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password']
      })
      @songs = client.get('/tracks', :q => params[:search], :limit => 10)

      @songs.each do |song|
        p song.uri
        p song.stream_url
        p song.id
        p "*" * 80
      end
  end
end


  ###test code not implemented yet
  # def create
  # client.post('/playlists', :playlist => {
  #           :title => 'My new album',
  #           :sharing => 'public',
  #           :tracks => tracks
  # })
  # end

  #   # tracks will take song id params to populate array used make a new playlist
  #   # ###create an array of track_id's BEFORE creating playlist
  #   #     tracks = [21778201, 22448500, 21922889].map {|id| {:id => id}}
  #   #
  ##test code end

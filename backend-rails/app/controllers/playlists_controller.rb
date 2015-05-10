class PlaylistsController < ApplicationController


  def new
    client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password']
      })
      @songs = client.get('/tracks', :q => params[:search], :limit => 10)

      # render json: @songs
      # @songs.each do |song|
        # p song.uri
        # p song.stream_url
        # p song.id
        # p "*" * 80
      # end

  end


  ###test code not implemented yet


  def create
  # p params[:track_id]
  p "*" * 80
    p params
    @user = User.find(params[:user_id])
    # @playlist = @user.playlists.create(name: params[:playlist_name])

    # @playlist = Playlist.create(name: params[:playlist_name], user_id:params[:user_id])
    # @playlist = @playlist.songs
    # @playlist = Playlist.all

    @playlist = Playlist.create(name: params[:name], genre: params[:genre], user_id:params[:user_id])
  #   playlist = @user.playlists.create(name: params[:name], genre: parmas[:genre], user_id: params[:user_id])
  p "*" * 80
    p @playlist

    ##ACTUAL playlist would exist already from the user instances
  ###@song = @user.playlists.find(1).songs.create!(track_id: params[:track_id].to_i, title: params[:title])
  render :json => @playlist



   # @song = Song.new(track_id: params[:track_id].to_i)
   # render json: @playlist
   # redirect_to
   # render json: @song
  end

  def show
    @user=User.find(1)
    @songs = @user.playlists.find(1).songs.each do |x|
           # x.
    end
  end
  #   # tracks will take song id params to populate array used make a new playlist
  #   # ###create an array of track_id's BEFORE creating playlist
  #   #     tracks = [21778201, 22448500, 21922889].map {|id| {:id => id}}
  #   #
  ##test code end

  def index
    p params
    @user = User.find(params[:user_id])
    fart = @user.playlists
    render :json => {user: @user, data: fart}
  end
end

class SongsController < ApplicationController

Dotenv.load

  def index
    client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password']
      })
      @songs = client.get('/tracks', :q => params[:search], :limit => 10)

      render json: @songs
  end

  def create
  ##ACTUAL playlist would exist already from the user instances
  @user = User.find(params[:user_id])
  @song = @user.playlists.find(params[:playlist_id]).songs.create!(track_id: params[:track_id].to_i, title: params[:title])
  # render :json => @playlist



   # @song = Song.new(track_id: params[:track_id].to_i)
   # render json: @playlist
   # redirect_to
   render json: @song
  end



  def show

  end

  def upskip
    song = Song.where(id: params[:id]).first
    song.skip += 1
    song.save
    p song.skip
    render json: {id: song.id, skip: song.skip}
  end

  def downskip
    song = Song.where(id: params[:id]).first
    song.skip -= 1
    song.save
    render json: {id: song.id, skip: song.skip}
  end

  def upreplay
    song = Song.where(id: params[:id]).first
    song.replay += 1
    song.save
    render json: {id: song.id, skip: song.replay}
  end

  def downreplay
    song = Song.where(id: params[:id]).first
    song.replay -= 1
    song.save
    render json: {id: song.id, skip: song.replay}
  end



end

class PlaylistsController < ApplicationController


  def new
    client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password']
      })
      @songs = client.get('/tracks', :q => params[:search], :limit => 10)

      render json: {songs: @songs}
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


   @song = Song.new(track_id: params[:track_id].to_i)

   render json: @song

  # client.post('/playlists', :playlist => {
  #           :title => 'My new album',
  #           :sharing => 'public',
  #           :tracks => tracks
  # })
  end

  #   # tracks will take song id params to populate array used make a new playlist
  #   # ###create an array of track_id's BEFORE creating playlist
  #   #     tracks = [21778201, 22448500, 21922889].map {|id| {:id => id}}
  #   #
  ##test code end
end

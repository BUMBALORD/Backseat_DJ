class PlaylistsController < ApplicationController
Dotenv.load
  def index

  end

  def new
        client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password']
    })
      @songs = client.get('/tracks', :q => params[:search])
      #lilwaynewouldbedynamic params
      # <p>ID <%= @songs.id %> </p>
      # <p> Genre <%= @songs.genre %></p>
      # <p> Title <%= @songs.title %></p>

  end

  # def create
  #   client=SoundCloud.new({
  #     :client_id => ENV['client_id'],
  #     :client_secret => ENV['client_secret'],
  #     :username => ENV['username'],
  #     :password => ENV['password']
  #   })
  #     @songs = client.get('/tracks', :q => params[:search])
  #     # p @songs
  #     @songs.each do |song|
  #       p song.title
  #     end
  #     # redirect_to new_playlist_path(@songs)
  #     redirect_to new_playlist_path
  #     # redirect_to new_playlist_path({:music => @songs})

  #   # tracks will take song id params to populate array used make a new playlist
  #   # ###create an array of track_id's BEFORE creating playlist
  #   #     tracks = [21778201, 22448500, 21922889].map {|id| {:id => id}}

  #   # tracks = [21778201, 22448500, 21922889].map {|id| {:id => id}}

  #   # client.post('/playlists', :playlist => {
  #   #           :title => 'My new album',
  #   #           :sharing => 'public',
  #   #           :tracks => tracks
  #   # })
  # end



end

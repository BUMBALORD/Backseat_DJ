# get '/' do
#   # @playlist = Playlist.find(1).songs
#       ##placeholder for params[:id]
#   erb :"playlists/index"
# end

get '/users/:user_id/playlists' do
  @test = params[:user_id]
  erb :"playlists/index"
end

get '/users/:user_id/playlists/:id' do
  @user = User.find(params[:user_id])
  # @playlist = Playlist.find(1).songs
      ##placeholder for params[:id]
  erb :"playlists/show"
end




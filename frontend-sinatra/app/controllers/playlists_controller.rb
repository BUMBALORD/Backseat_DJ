# get '/' do
#   # @playlist = Playlist.find(1).songs
#       ##placeholder for params[:id]
#   erb :"playlists/index"
# end

get '/users/:user_id/playlists/:id' do
  @user = User.find(params[:user_id])
  # @playlist = Playlist.find(1).songs
      ##placeholder for params[:id]
  erb :"playlists/show"
end

post '/users/:user_id/playlists/:id' do
  p params
  erb :"playlists/show"
end


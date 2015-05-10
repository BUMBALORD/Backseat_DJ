get '/' do
  # @playlist = Playlist.find(1).songs
      ##placeholder for params[:id]
  erb :index
end

get '/callback.html' do
  p params
  erb :callback
end


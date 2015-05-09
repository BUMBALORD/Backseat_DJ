get '/' do
  erb :index
end

get '/callback.html' do
  p params
  erb :callback
end

get '/users' do
  erb :users
end

get '/users/new' do
  erb :new
end

get '/users/:user_id/playlists' do
  erb :playlist
end
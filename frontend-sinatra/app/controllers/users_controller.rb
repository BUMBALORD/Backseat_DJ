get '/' do
  erb :"users/index"
end

get '/callback.html' do
  p params
  erb :"users/callback"
end

get '/users' do
  erb :"users/users"
end

get '/users/new' do
  erb :"users/new"
end

# get '/users/:user_id/playlists' do
#   p params
#   @user = params[:user_id]
#   erb :"playlists/new"
# end

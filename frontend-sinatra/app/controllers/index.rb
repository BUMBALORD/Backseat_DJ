get '/' do
  erb :index
end

get '/callback.html' do
  p params
  erb :callback
end
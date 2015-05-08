
class PlaylistsController < ApplicationController
Dotenv.load
  def index
    client=SoundCloud.new({
      :client_id => ENV['client_id'],
      :client_secret => ENV['client_secret'],
      :username => ENV['username'],
      :password => ENV['password']
      # :redirect_uri  => "http://localhost:3000",
    })


      @asdf = client.get('/tracks')
       # @asdf = @asdf[0]

      # @bankz = []
      # @asdf = client.get('/tracks', :q => 'young thug')
      # @asdf.each do |xyz|
      #   @bankz << xyz.title
      # end
      # render :js => @bankz.to_json


      # render :js => @asdf.to_json
      # render :html => @asdf

  end


end

class ApplicationController < ActionController::API

    def index
       # register a client with YOUR_CLIENT_ID as client_id_
        client = SoundCloud.new(:client_id => YOUR_CLIENT_ID)
        # get 10 hottest tracks
        tracks = client.get('/tracks', :limit => 10, :order => 'hotness')
        # print each link
        tracks.each do |track|
          puts track.permalink_url
        end


        response = HTTParty.get("https://api.github.com/zen",
        {headers:
          {"User-Agent" => "Malibootay",
            "Authorization" => 'token ' + ENV['key']
            }
          })
        @zen = response.parsed_response

    end




end

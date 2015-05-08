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

  # skip_before_filter :verify_authenticity_token   # this may not be necessary

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

end

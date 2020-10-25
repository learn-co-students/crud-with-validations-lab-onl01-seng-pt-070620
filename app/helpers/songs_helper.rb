module SongsHelper
  def grab_art(song)
    request = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=#{song.artist_name}&api_key=#{Rails.application.secrets.API_KEY}&format=json").to_json

    JSON.parse(request)['topalbums']['album'].first['image'].last['#text'] unless request.include?("error")
  end
end

require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIEND_SECRET'], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-library-read user-top-read'
end

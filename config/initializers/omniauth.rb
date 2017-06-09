require 'rspotify/oauth'

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-library-read user-top-read'
# end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'd6fbdd8b0dae4eb2a52544d9e0388a6b', '54f52ae3f28a41aab02406892128bb92', scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-library-read user-top-read'
end

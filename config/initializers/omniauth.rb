require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "d6fbdd8b0dae4eb2a52544d9e0388a6b", "380596b450dc437ebbef1001b31dbce1", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-library-read user-top-read'
end

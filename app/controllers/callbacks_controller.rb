class CallbacksController < ApplicationController

  def index
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    user = User.find_by(email: spotify_user.email)

    user ||= User.create_from_spotify_oauth(spotify_user)
    session[:user_id] = user.id
    redirect_to root_path,notice: 'Thank you for signing in with spotify'
    
  end


end

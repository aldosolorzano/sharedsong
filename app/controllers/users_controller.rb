class UsersController < ApplicationController

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    artists = RSpotify::Artist.search('Nicolas Jaar')
    @current_artist = artists.first

  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name,:last_name,:email,
                                           :password, :password_confirmation)
   @user = User.new user_params

   if @user.save
     session[:user_id] = @user.id
     redirect_to root_path, notice: 'Sign up succesfull'
   else
     render :new
   end

  end
end

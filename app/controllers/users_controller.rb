class UsersController < ApplicationController

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    user = User.find_by(email: spotify_user.email)
    display_name = request.env['omniauth.auth'].info.nickname

    user ||= User.create_from_spotify_oauth(spotify_user, display_name)
    session[:user_id] = user.id
    # render json: spotify_user
    redirect_to root_path,notice: "Thank you #{display_name} for signing in with spotify"
  end

  def autocomplete
    users = User.search(params[:query], {
    fields: ["first_name", "last_name"],
    limit: 10,
    load: false,
    misspellings: {below: 5}
  }).map(&:name)

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

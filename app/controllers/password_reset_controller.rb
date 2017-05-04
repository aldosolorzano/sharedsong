class PasswordResetController < ApplicationController
  before_action :authenticate_user!
before_action :current_password_authentication,only:[:create]
def new
end

def create
  @user = current_user
  password_params = params.permit([:password,:password_confirmation])

    if @user.update password_params
      redirect_to edit_user_path(@user),notice: 'Password Updated'
    else
      render :new
    end
  end

private

 def current_password_authentication
   current_password =params[:current_password]
   current_password_confirmation = params[:current_password_confirmation]

  if current_vs_new_password
    if current_password == current_password_confirmation &&
      current_user.authenticate(params[:current_password])
      true
    else
      redirect_to new_password_reset_path,notice: 'invalid params'
    end
  else
    redirect_to new_password_reset_path,notice: 'invalid params'
  end

end

def current_vs_new_password
  params[:current_password] != params[:password]
end

end

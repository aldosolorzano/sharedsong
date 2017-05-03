class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    # if params[:status] == 'request'
    #   requested = User.find params[:user_id]
    #   current_user.friend_request(requested)
    # elsif params[:status] == 'accept'
    #   requester = User.find params[:user_id]
    #   current_user.accept_request(requester)
    #   redirect_to root_path
    # elsif params[:status] == 'decline'
    #   requester = User.find params[:user_id]
    #   current_user.decline_request(requester)
    #   redirect_to root_path
    # end
  end

end

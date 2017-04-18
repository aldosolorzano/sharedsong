class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    requester = current_user
    requested = User.find params[:user_id]
    requester.friend_request(requested)
  end


end

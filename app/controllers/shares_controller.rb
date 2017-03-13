class SharesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @shares = Share.order(created_at: :desc)
  end

  def new
    @share = Share.new
  end

  def create
    share_params = params.require(:share).permit(:title)
    @share = Share.new share_params
    @share.user = User.first

    if @share.save
      redirect_to root_path, notice:'Share created'
    else
      render :new
    end
  end
end

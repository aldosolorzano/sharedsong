class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize,only:[:edit,:update,:destroy]
  def index
    @shared_songs = current_user.shared_songs
    @shares = current_user.shares.order(created_at: :desc)
  end

  def new
    @songs = params[:current_song]
    @share = Share.new
  end

  def edit
    @share = Share.find params[:id]
  end

  def create
    share_params = params.require(:share).permit(:title, :artist,{shared_user_ids:[]})
    @share = Share.new share_params
    @share.user = current_user
    @share.song = Song.find_by(name: params[:title])

    if @share.save
      redirect_to root_path, notice:'Share created'
    else
      render :new
    end
  end

  def update
    share_params = params.require(:share).permit(:title, :artist,{shared_user_ids:[]})
    share = Share.find params[:id]

    if share.update share_params
      redirect_to root_path, notice: 'Share updated!'
    else
      render :edit
    end
  end

  def destroy
    share = Share.find params[:id]
    share.destroy
    redirect_to root_path,notice:'Shared deleted'
  end

  private

  def authorize
    @share = Share.find params[:id]
    if cannot?(:manage,@share)
      redirect_to root_path,alert:'Denied permissions'
    end
  end
end

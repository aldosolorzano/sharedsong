class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize,only:[:destroy]
  def index
    @shared_songs = current_user.create_array_of_accepted_shares
    @shares = current_user.shares.order(created_at: :desc)
  end

  def new
    @search_query = params[:search_query]
    @share = Share.new
  end

  def edit
    @share = Share.find params[:id]
  end

  def create
    share_params = params.require(:share).permit(:title, :artist,{shared_user_ids:[]})
    @share = Share.new share_params
    @share.user = current_user
    song = Song.find_by(name: params[:share][:title])
    if song.nil?
      @share.song = Song.create(name: params[:share][:title],artist: params[:share][:artist])
    else
      @share.song = song
    end

    if @share.save
      redirect_to root_path, notice:'Share created'
    else
      render :new
    end
  end

  def update
    share = Share.find params[:id]
    user_share = share.shared_to(current_user)
    if user_share
       if params[:status] == 'accept'
         user_share.accept
       else
         user_share.reject
       end
       user_share.save
       redirect_to root_path
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

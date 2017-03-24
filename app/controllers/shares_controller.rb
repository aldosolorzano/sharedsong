class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize,only:[:edit,:update]

  def index
    @shared_songs = current_user.shared_songs
    @shares = current_user.shares.order(created_at: :desc)
  end

  def new
    @share = Share.new
  end

  def edit
    @share = Share.find params[:id]
  end

  def create
    # share_params = params.require(:share).permit(:title, :artist,{shared_user_ids:[]})
    # @share = Share.new share_params
    # @share.user = current_user
    # @share.song = Song.find_by(name: params[:title])
    #
    # if @share.save
    #   redirect_to root_path, notice:'Share created'
    # else
    #   render :new
    # end
    @share = Share.new
    search_term = params[:share][:artist]
    search_cache_query = SearchCache.where("search_term ILIKE ?", "%#{search_term}%")
    if search_cache_query.empty?
      response = RSpotify::Track.search(search_term)
      json_response = response.first.to_json
      SearchCache.create(search_term:search_term, result:json_response)
      @song = JSON.parse json_response
    else
      @song = JSON.parse search_cache_query.first.result
    end

    # render json: @song
    render :new
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

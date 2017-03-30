class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_share,only:[:create]
  before_action :find_like,except:[:create]

  def create
    like = Like.new user:current_user, share:@share, is_up:params[:is_up]

    like.save
    redirect_to root_path

  end

  def destroy
    @like.destroy
    redirect_to root_path

  end

  def update

    if @like.update is_up: params[:is_up]
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def find_like
    @like = Like.find params[:id]
  end

  def find_share
    @share = Share.find params[:share_id]
  end

end

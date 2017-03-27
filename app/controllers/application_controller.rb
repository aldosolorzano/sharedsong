class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_song
    @song
  end

  def search_cache_query search_term
    query = SearchCache.where("search_term ILIKE ?", "%#{search_term}%")
    if query.empty?
      @song = connect_spotify search_term
      redirect_to new_share_path({current_song:@song})
    else
      @song = JSON.parse query.first.result
      redirect_to new_share_path({current_song:@song})
    end
  end


  def connect_spotify search_term
    response = RSpotify::Track.search(search_term)
    # byebug
    json_response = response.first.to_json

    if json_response != "null"
      SearchCache.create(search_term:search_term, result:json_response)
      JSON.parse json_response
    end
  end

  def current_user
    User.find session[:user_id] if user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def authenticate_user!
      redirect_to new_session_path, alert: 'Please Sign In' unless user_signed_in?
  end

  helper_method :user_signed_in?, :current_user

end

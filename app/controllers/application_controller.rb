class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_song
    @song
  end

  def search_cache_query search_term
    # query = SearchCache.where("search_term ILIKE ?", "%#{search_term}%")
    query = SearchCache.search(search_term)
    if query.empty?
      @song = connect_spotify search_term
      redirect_to new_share_path({current_song:@song})
    else
      @song = query.first.create_array_of_songs
      redirect_to new_share_path({current_song:@song})
    end
  end


  def connect_spotify search_term
    spotify_response = RSpotify::Track.search(search_term)
    # render json: spotify_response.first
    # byebug
    if spotify_response == "null" || spotify_response.empty?
      UserSearchHistory.create(
      user: current_user,
      search_term:  search_term,
      success: false
      )
      return nil
    else
      search_cache_song = SearchCache.create(
      search_term: search_term,
      result: spotify_response
      )

      UserSearchHistory.create(
      user: current_user,
      search_term:  search_term,
      success: true
      )

      search_cache_song.create_array_of_songs
    end
  end

  def current_user
    User.find session[:user_id] if user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def authenticate_user!
      redirect_to new_session_path unless user_signed_in?
  end

  helper_method :user_signed_in?, :current_user

end

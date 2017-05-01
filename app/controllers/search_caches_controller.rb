class SearchCachesController < ApplicationController
  
  def create
    search_cache_query params[:song]
  end
end

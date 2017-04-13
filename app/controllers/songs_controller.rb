class SongsController < ApplicationController
  def autocomplete
      songs = Song.search(params[:query], {
      fields: ["name", "artist"],
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)

    puts songs
    render json: songs
  end
end

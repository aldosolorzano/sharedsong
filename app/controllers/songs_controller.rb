class SongsController < ApplicationController
  def autocomplete
      songs = Song.search(params[:query], {
      fields: ["name", "artist"],
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)

  end
end

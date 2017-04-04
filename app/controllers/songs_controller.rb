class SongsController < ApplicationController
  def autocomplete
      Song.search(params[:song], {
      fields: ["name", "artist"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map do |song|
      puts "song.name"
    end
  end
end

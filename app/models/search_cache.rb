class SearchCache < ApplicationRecord
  searchkick word_middle: [:search_term]
  validates :search_term, uniqueness:true, case_sensitive:false, presence:true

  serialize :result, Array

  def create_array_of_songs
    songs = []
    self.result.each do |s|
        songs.push(
              {
                song_name:s.name,
                artist_name:s.artists.first.name,
                uri: s.preview_url,
                image: s.album.images.last
                }
                )
    end
    songs.slice(0,1)
  end

  def search_data
    {
      search_term: search_term
    }
  end

end

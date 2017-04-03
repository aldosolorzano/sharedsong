class SearchCache < ApplicationRecord
  validates :search_term, uniqueness:true, case_sensitive:false

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
    songs
  end
  

end

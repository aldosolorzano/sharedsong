class Song < ApplicationRecord
  has_many :shares, dependent: :nullify
  searchkick word_middle: [:name,:artist]

  def search_data
    {
      artist: artist,
      name: name
    }
  end

end

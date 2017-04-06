class Song < ApplicationRecord
  has_many :shares, dependent: :nullify
  searchkick word_middle: [:first_name,:last_name]

  def search_data
    {
      artist: artist,
      name: name
    }
  end

end

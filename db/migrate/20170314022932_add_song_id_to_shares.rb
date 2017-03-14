class AddSongIdToShares < ActiveRecord::Migration[5.0]
  def change
    add_reference :shares, :song, foreign_key: true
  end 
end

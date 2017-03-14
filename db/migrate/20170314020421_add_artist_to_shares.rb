class AddArtistToShares < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :artist, :string
  end
end

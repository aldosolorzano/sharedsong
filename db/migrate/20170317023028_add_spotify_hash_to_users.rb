class AddSpotifyHashToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :spotify_hash, :string
  end
end

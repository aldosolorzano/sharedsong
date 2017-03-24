class ChangeSpotifyHashFormatInUsers < ActiveRecord::Migration[5.0]
  def change
     change_column :users, :spotify_hash, :text
  end
end

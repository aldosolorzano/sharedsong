class CreateUserShares < ActiveRecord::Migration[5.0]
  def change
    create_table :user_shares do |t|
      t.references :user, foreign_key: true
      t.references :share, foreign_key: true

      t.timestamps
    end
  end
end

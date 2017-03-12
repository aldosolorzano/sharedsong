class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

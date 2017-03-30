class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :share, foreign_key: true
      t.boolean    :is_up
      
      t.timestamps
    end
  end
end

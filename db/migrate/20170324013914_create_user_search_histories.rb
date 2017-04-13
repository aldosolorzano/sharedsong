class CreateUserSearchHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_search_histories do |t|
      t.references :user, foreign_key: true
      t.string :search_term
      t.boolean :success

      t.timestamps
    end
    add_index :user_search_histories, :search_term
  end
end

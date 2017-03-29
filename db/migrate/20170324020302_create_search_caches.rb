class CreateSearchCaches < ActiveRecord::Migration[5.0]
  def change
    create_table :search_caches do |t|
      t.string :search_term
      t.text :result

      t.timestamps
    end
    add_index :search_caches, :search_term
  end
end

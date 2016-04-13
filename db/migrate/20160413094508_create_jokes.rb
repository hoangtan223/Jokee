class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :content
      t.integer :likes
      t.integer :dislikes

      t.timestamps null: false
    end
  end
end

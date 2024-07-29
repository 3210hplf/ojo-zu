class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title,      null:false
      t.string :image,      null:false
      t.date :created_date, null:false
      t.string :explanation

      t.timestamps
    end
    add_reference :posts, :child, foreign_key: true
  end
end

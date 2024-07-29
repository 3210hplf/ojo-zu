class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.string :name,       null: false
      t.date :birthday,     null:false
      t.string :avatar_image

      t.timestamps
    end
    add_reference :children, :user, foreign_key: true
  end
end

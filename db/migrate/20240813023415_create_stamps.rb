class CreateStamps < ActiveRecord::Migration[7.1]
  def change
    create_table :stamps do |t|
      t.string :stamp_type, null:false

      t.timestamps
    end
    add_reference :stamps, :user, foreign_key: true
    add_reference :stamps, :post, foreign_key: true
    add_index :stamps, [:user_id, :post_id], unique: true
  end
end

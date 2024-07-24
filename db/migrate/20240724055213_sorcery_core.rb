class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.integer :role,            null: false #enumで投稿者、閲覧者の情報を持つ

      t.timestamps                null: false
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :name,          null: false
      t.integer :relationship, null: false #enumで続柄の情報を持つ
      t.string :avatar
      t.integer :ticket_count

      t.timestamps
    end
    add_reference :profiles, :user, foreign_key: true
  end
end

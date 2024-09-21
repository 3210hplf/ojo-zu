class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string     :token,       null: false
      t.datetime   :expired_at,  null: false

      t.timestamps
    end
    add_reference :invitations, :user, foreign_key: true
  end
end

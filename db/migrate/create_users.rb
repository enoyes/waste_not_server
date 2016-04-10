class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :handle
      t.string :email
      t.string :password_digest
      t.string :token
      t.datetime :last_sync

      t.timestamps
    end
  end
end

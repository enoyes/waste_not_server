class 20160410199110 < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :handle
      t.string :email
      t.string :password_digest
      t.string :token
      t.datetime :last_sync
      t.belongs_to :group

      t.timestamps
    end
  end
end

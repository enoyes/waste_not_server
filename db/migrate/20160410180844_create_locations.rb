class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :group
      t.intefer :l_id
    end
  end
end

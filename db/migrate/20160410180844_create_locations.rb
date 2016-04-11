class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :group
      t.string :name

      t.timestamps
    end
  end
end

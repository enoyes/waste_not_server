class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.integer :f_id
      t.string :name
      t.string :desc
      t.datetime :purchased
      t.datetime :expiration
      t.integer :size_value
      t.string :size_unit
      t.integer :remaining
      t.integer :owner
      t.boolean :public
      t.integer :location

    end
  end
end

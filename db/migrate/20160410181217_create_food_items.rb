class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :f_id
      t.string :name
      t.string :desc
      t.datetime :purchased
      t.datetime :expiration
      t.integer :size_value
      t.string :size_unit
      t.integer :remaining
      t.belongs_to :user
      t.boolean :public
      t.belongs_to :location
      t.boolean :deleted

      t.timestamps

    end
  end
end

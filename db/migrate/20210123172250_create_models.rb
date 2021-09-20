class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.text :description
      t.integer :selling_price
      t.integer :year_of_release
      t.string :usb_type
      t.integer :battery_capacity
      t.integer :height
      t.integer :width
      t.string :sim_type
      t.string :colour
      t.string :network_supported

      t.timestamps null: false
    end
  end
end

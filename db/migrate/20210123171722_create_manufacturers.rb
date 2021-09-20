class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :year_of_establishment
      t.string :parent_company

      t.timestamps null: false
    end
  end
end

class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :primary
      t.integer :secondary
      t.integer :extended
      t.string :memory_card

      t.timestamps null: false
    end
  end
end

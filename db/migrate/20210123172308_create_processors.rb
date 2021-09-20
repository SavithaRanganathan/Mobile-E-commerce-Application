class CreateProcessors < ActiveRecord::Migration
  def change
    create_table :processors do |t|
      t.string :name
      t.string :company
      t.integer :speed

      t.timestamps null: false
    end
  end
end

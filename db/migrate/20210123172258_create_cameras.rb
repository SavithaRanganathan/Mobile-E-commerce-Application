class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.integer :type
      t.integer :postion
      t.integer :pixel

      t.timestamps null: false
    end
  end
end

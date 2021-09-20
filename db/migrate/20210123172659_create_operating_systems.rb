class CreateOperatingSystems < ActiveRecord::Migration
  def change
    create_table :operating_systems do |t|
      t.string :name
      t.string :company
      t.float :version

      t.timestamps null: false
    end
  end
end

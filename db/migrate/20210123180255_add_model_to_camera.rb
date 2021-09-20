class AddModelToCamera < ActiveRecord::Migration
  def change
    add_reference :cameras, :model, index: true, foreign_key: true
  end
end

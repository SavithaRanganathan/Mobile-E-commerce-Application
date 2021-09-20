class AddManufactureToModel < ActiveRecord::Migration
  def change
    add_reference :models, :manufacturer, index: true, foreign_key: true
    add_reference :models, :storage, index: true, foreign_key: true
    add_reference :models, :processor, index: true, foreign_key: true
    add_reference :models, :operating_system, index: true, foreign_key: true
  end
end

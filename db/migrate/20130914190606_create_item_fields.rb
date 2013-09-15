class CreateItemFields < ActiveRecord::Migration
  def change
    create_table :item_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :item_type

      t.timestamps
    end
    add_index :item_fields, :item_type_id
  end
end

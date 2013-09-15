class AddTypeToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_type_id, :integer
    add_column :items, :properties, :text
  end
end

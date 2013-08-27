class AddActiveToTags < ActiveRecord::Migration
  def change
    add_column :tags, :active, :boolean
  end
end

class AddImageToPoints < ActiveRecord::Migration
  def change
    add_column :points, :image, :string
  end
end

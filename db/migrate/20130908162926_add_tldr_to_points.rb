class AddTldrToPoints < ActiveRecord::Migration
  def change
    add_column :points, :tldr, :text
  end
end

class DropImageFromPosts < ActiveRecord::Migration
  def self.up
    drop_attached_file :posts, :image
  end

  def self.down
    change_table :posts do |t|
      t.attachment :image
    end
  end
end

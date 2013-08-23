class DropImageFromPhotos < ActiveRecord::Migration
  def self.up
    drop_attached_file :photos, :image
  end
  
  def self.down
    change_table :photos do |t|
      t.attachment :image
    end
  end
end

class ChangeFeedlingColumnNames < ActiveRecord::Migration
  def change
  	  rename_column :feedlings, :taggable_type, :feedable_type
      rename_column :feedlings, :taggable_id, :feedable_id
      rename_column :feedlings, :tag_id, :feed_id
  end
end

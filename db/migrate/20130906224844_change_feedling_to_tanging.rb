class ChangeFeedlingToTanging < ActiveRecord::Migration
  def change
  	  rename_column :tangings, :feedable_type, :tangable_type
      rename_column :tangings, :feedable_id, :tangable_id
      rename_column :tangings, :feed_id, :tangent_id
  end
end

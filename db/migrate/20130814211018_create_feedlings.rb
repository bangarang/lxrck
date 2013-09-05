class CreateFeedlings < ActiveRecord::Migration
  def change
    create_table :feedlings do |t|
      t.string :feedable_type
      t.integer :feedable_id
      t.integer :feed_id

      t.timestamps
    end
  end
end
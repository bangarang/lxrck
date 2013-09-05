class ChangeTagToFeed < ActiveRecord::Migration
    def change
        rename_table :tags, :feeds
        rename_table :taggings, :feedlings
    end 
end

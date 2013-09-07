class ChangeFeedToTangent < ActiveRecord::Migration
    def change
        rename_table :feeds, :tangents
        rename_table :feedlings, :tangings
    end 
end

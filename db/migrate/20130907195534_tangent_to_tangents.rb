class TangentToTangents < ActiveRecord::Migration
    def change
        rename_table :tangent, :tangents
    end 
end

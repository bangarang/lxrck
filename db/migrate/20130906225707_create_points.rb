class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :name
      t.string :slug
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end

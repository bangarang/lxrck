class ItemField < ActiveRecord::Base
  belongs_to :item_type
  attr_accessible :field_type, :name, :required
end

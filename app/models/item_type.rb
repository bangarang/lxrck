class ItemType < ActiveRecord::Base
  attr_accessible :name, :fields_attributes
  has_many :fields, class_name: "ItemField"
  accepts_nested_attributes_for :fields, allow_destroy: true
end

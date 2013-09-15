class Item < ActiveRecord::Base
  attr_accessible :name, :item_type_id, :properties, :tangent_list, :image, :remote_image_url
  belongs_to :item_type
  serialize :properties, Hash

  mount_uploader :image, ImageUploader

  has_many :tangings, :as => :tangable, :dependent => :destroy
  has_many :tangents, :through => :tangings

  def tangent_list
    tangents.map(&:name).join(", ")
  end
  
  def tangent_list=(names)
    self.tangents = names.split(",").map do |n|
      Tangent.where(name: n.strip, active: true).first_or_create!
    end
  end

  def type
  	return :item
  end
end

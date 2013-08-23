class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :tag_list, :remote_image_url

  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings

  mount_uploader :image, ImageUploader

  def type
  	return :photo
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
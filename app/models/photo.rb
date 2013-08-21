class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :tag_list

  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings


  has_attached_file :image, :styles => { :medium => "1000x1000>", :thumb => "250x250>" }

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
class Post < ActiveRecord::Base
  attr_accessible :content, :title, :image, :slug, :tag_list

  before_save :generate_slug

  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings

  has_attached_file :image, :styles => { :medium => "1000x1000>", :thumb => "300x300#" }


  def type
  	return :post
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug = title.parameterize
  end
end

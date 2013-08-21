class Tag < ActiveRecord::Base
  attr_accessible :name, :slug, :description
  before_save :generate_slug
  
  has_many :taggings
  has_many :taggables, :through => :taggings

  def list 
  	tagged = []

  	for t in self.taggings
  		tagged << t.taggable
  	end

  	return tagged.reverse
  end

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug = name.parameterize
  end

  def photo
    for item in self.list 
      if item.type == :photo 
        photo = item
      end
    end
    return photo
  end
end

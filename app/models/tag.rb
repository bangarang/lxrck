class Tag < ActiveRecord::Base
  attr_accessible :name, :slug, :description, :active
  before_save :generate_slug
  before_save :set_active
  
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
    return self.list.first 
  end

  def acitve?
    self.active 
  end

    def set_active
    self.active ||= false
  end
end

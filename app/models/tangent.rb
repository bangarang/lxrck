class Tangent < ActiveRecord::Base
  attr_accessible :name, :slug, :description, :active
  before_save :generate_slug
  before_save :set_active
  
  has_many :tangings
  has_many :tangables, :through => :tangings

  def list 
  	t = []
  	for t in self.tangings
  		t << t.tangable
  	end
  	return t.reverse
  end

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug = name.parameterize
  end

  def photo
    tmp = nil
    self.list.each do |a| 
      if a.type == :photo
        tmp = a
      elsif a.type == :post
        nil
      end
    end
    return tmp
  end

  def acitve?
    self.active 
  end
end

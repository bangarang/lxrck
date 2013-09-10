class Tangent < ActiveRecord::Base
  attr_accessible :name, :slug, :description, :active
  before_save :generate_slug
  
  has_many :tangings
  has_many :tangables, :through => :tangings

  def list 
  	tmp = []
  	for t in self.tangings
  		tmp << t.tangable
  	end
  	return tmp.reverse
  end

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug = name.parameterize
  end

  def photo
    tmp = nil
    self.tangings.each do |a| 
      if a.tangable.type == :photo
        tmp = a.tangable
      elsif a.tangable.type == :post
        nil
      end
    end
    return tmp
  end

  def acitve?
    self.active 
  end
end

class Point < ActiveRecord::Base
  attr_accessible :content, :name, :slug, :tangent_list, :remote_image_url, :published

  before_save :generate_slug

  has_many :tangings, :as => :tangable, :dependent => :destroy
  has_many :tangents, :through => :tangings

  def tangent_list
    tangents.map(&:name).join(", ")
  end
  
  def tangent_list=(names)
    self.tangents = names.split(",").map do |n|
      Tanget.where(name: n.strip, active: true).first_or_create!
    end
  end

  def type
    return :point
  end

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug = name.parameterize
  end

  def published?
    self.published
  end
end

class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :tangent_list, :remote_image_url

  mount_uploader :image, ImageUploader
  
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
  	return :photo
  end
end
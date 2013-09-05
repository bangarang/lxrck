class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :feed_list, :remote_image_url

  has_many :feedlings, :as => :feedable, :dependent => :destroy
  has_many :feeds, :through => :feedlings

  mount_uploader :image, ImageUploader

  def type
  	return :photo
  end

  def feed_list
    feeds.map(&:name).join(", ")
  end
  
  def feed_list=(names)
    self.feeds = names.split(",").map do |n|
      Feed.where(name: n.strip, active: true).first_or_create!
    end
  end
end
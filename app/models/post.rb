class Post < ActiveRecord::Base
  attr_accessible :content, :title, :slug, :feed_list, :remote_image_url, :published

  before_save :generate_slug
  before_save :set_published

  has_many :feedlings, :as => :feedable, :dependent => :destroy
  has_many :feeds, :through => :feedlings

  def type
  	return :post
  end

  def feed_list
    feeds.map(&:name).join(", ")
  end
  
  def feed_list=(names)
    self.feeds = names.split(",").map do |n|
      Feed.where(name: n.strip, active: true).first_or_create!
    end
  end

  def to_param
    slug # or "#{id}-#{name}".parameterize
  end

  def generate_slug
    self.slug = title.parameterize
  end

  def published?
    self.published
  end

  def set_published
    self.published ||= false
  end

end

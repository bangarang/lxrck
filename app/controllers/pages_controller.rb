class PagesController < ApplicationController

  before_filter :authorize, :except => :home

  def home
  	@tangents = Tangent.where( :active => true )
    @points = Point.find( :all, :conditions => { :published => true },:order => "created_at DESC", :limit => 5)
    @photo = Photo.last
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end

  end

  def in
  end
  
  def styles
  end

end

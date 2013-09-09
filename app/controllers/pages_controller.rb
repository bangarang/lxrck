class PagesController < ApplicationController

  before_filter :authorize, :except => :home
  def home
  	@feeds = Tangent.where( :active => true )
    @points = Point.limit(5)
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

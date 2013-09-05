class PagesController < ApplicationController

  before_filter :authorize, :except => :home
  def home
  	@feeds = Feed.where( :active => true )
    @post = Post.last
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

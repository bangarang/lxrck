class PagesController < ApplicationController

  before_filter :authorize, :except => :home
  def home
  end

  def in
  end
end

class MessagesController < ApplicationController
  respond_to :json

  def index
     @messages = Message.all
 
	  respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @messages }
	  end
  end

  def show
    respond_with Message.find(params[:id])
  end

  def create
    respond_with Message.create(params[:message])
  end

  def update
    respond_with Message.update(params[:id], params[:message])
  end

  def destroy
    respond_with Message.destroy(params[:id])
  end
end
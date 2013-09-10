class TangentsController < ApplicationController
  before_filter :find_tangent, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:index, :show]

  def index
    @tangents = Tangent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tangents }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tangent }
    end
  end

  def new
    @tangent = Tangent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tangent }
    end
  end

  def edit
    @tangent.generate_slug
    @tangent.save
  end

  def create
    @tangent = Tangent.new(params[:tangent])

    respond_to do |format|
      if @tangent.save
        format.html { redirect_to @tangent, notice: 'Tangent was successfully created.' }
        format.json { render json: @tangent, status: :created, location: @tangent }
      else
        format.html { render action: "new" }
        format.json { render json: @tangent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tangent.update_attributes(params[:tangent])
        format.html { redirect_to @tangent, notice: 'Tangent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tangent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tangent.destroy

    respond_to do |format|
      format.html { redirect_to tangents_url }
      format.json { head :no_content }
    end
  end

  private 
    def find_tangent
      @tangent = Tangent.find_by_slug!(params[:id])
    end
end

class PointsController < ApplicationController

  before_filter :find_point, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:index, :show]
  # GET /points
  # GET /points.json
  def index
    @points = Point.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/new
  # GET /points/new.json
  def new
    @point = Point.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(params[:point])

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
        format.json { render json: @point, status: :created, location: @point }
      else
        format.html { render action: "new" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.json
  def update
    # @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point.destroy

    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end

  private 
    def find_point
      @point = Point.find_by_slug!(params[:id])
    end
end

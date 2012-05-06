class BirdsoundsController < ApplicationController
  respond_to :json, :xml

  # GET /random/12.json
  def random
    count = [100, params[:count].to_i].min
    respond_with Birdsound.random(count)
  end

  # GET /birdsounds
  # GET /birdsounds.json
  def index
    @birdsounds = Birdsound.all
    respond_with @birsounds
  end

  # GET /birdsounds/1
  # GET /birdsounds/1.json
  def show
    @birdsound = Birdsound.find(params[:id])
    respond_with @birsound
  end

  # GET /birdsounds/new
  # GET /birdsounds/new.json
  #def new
  #  @birdsound = Birdsound.new
  #  respond_with @birsound
  #end

  # GET /birdsounds/1/edit
  #def edit
  #  @birdsound = Birdsound.find(params[:id])
  #end

  # POST /birdsounds
  # POST /birdsounds.json
  #def create
  #  @birdsound = Birdsound.new(params[:birdsound])
  #
  #  respond_to do |format|
  #    if @birdsound.save
  #      format.html { redirect_to @birdsound, notice: 'Birdsound was successfully created.' }
  #      format.json { render json: @birdsound, status: :created, location: @birdsound }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @birdsound.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /birdsounds/1
  # PUT /birdsounds/1.json
  #def update
  #  @birdsound = Birdsound.find(params[:id])
  #
  #  respond_to do |format|
  #    if @birdsound.update_attributes(params[:birdsound])
  #      format.html { redirect_to @birdsound, notice: 'Birdsound was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @birdsound.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /birdsounds/1
  # DELETE /birdsounds/1.json
  #def destroy
  #  @birdsound = Birdsound.find(params[:id])
  #  @birdsound.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to birdsounds_url }
  #    format.json { head :no_content }
  #  end
  #end
end

class PartsController < ApplicationController
  #on_the_spot for in place editing
  load_and_authorize_resource  :except => [ :update_attribute_on_the_spot, :price ]
  
  helper :all
  
  can_edit_on_the_spot  # GET /parts
    
  # GET /parts.xml
  def index
    @part_types = PartType.all
    @parts = Part.order('updated_at DESC').page params[:page]
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parts }
      format.js
    end
  end

  # GET /parts/1
  # GET /parts/1.xml
  def show
    @part = Part.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @part }
    end
  end

  # GET /parts/new
  # GET /parts/new.xml
  def new
    @part = Part.new
    @part_types = PartType.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @part }
    end
  end

  # GET /parts/1/edit
  def edit
    @part = Part.find(params[:id])
  end

  # POST /parts
  # POST /parts.xml
  def create
    @part = Part.new(params[:part])

    respond_to do |format|
      if @part.save
        format.html { redirect_to(parts_path, :notice => 'Part was successfully created.') }
        format.xml  { render :xml => @part, :status => :created, :location => @part }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parts/1
  # PUT /parts/1.xml
  def update
    @part = Part.find(params[:id])

    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.html { redirect_to(@part, :notice => 'Part was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.xml
  def destroy
    @part = Part.find(params[:id])
    @part.destroy

    respond_to do |format|
      format.html { redirect_to(parts_url) }
      format.xml  { head :ok }
    end
  end
  
  def price
    @price = Part.find(params[:id])
    respond_to do |format|
      format.js { render :text => @price.price }
    end
  end
  
end

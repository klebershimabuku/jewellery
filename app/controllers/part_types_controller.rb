class PartTypesController < ApplicationController

  #on_the_spot for in place editing
  can_edit_on_the_spot
  
  load_and_authorize_resource :except => :update_attribute_on_the_spot #cancan
  
  
  
  # GET /part_types
  # GET /part_types.xml
  def index
    @part_types = PartType.order('updated_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @part_types }
    end
  end

  # GET /part_types/1
  # GET /part_types/1.xml
  def show
    @part_type = PartType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @part_type }
    end
  end

  # GET /part_types/new
  # GET /part_types/new.xml
  def new
    @part_type = PartType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @part_type }
    end
  end

  # GET /part_types/1/edit
  def edit
    @part_type = PartType.find(params[:id])
  end

  # POST /part_types
  # POST /part_types.xml
  def create
    @part_type = PartType.new(params[:part_type])

    respond_to do |format|
      if @part_type.save
        format.html { redirect_to(part_types_url, :notice => 'Part type was successfully created.') }
        format.xml  { render :xml => @part_type, :status => :created, :location => @part_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @part_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /part_types/1
  # PUT /part_types/1.xml
  def update
    @part_type = PartType.find(params[:id])

    respond_to do |format|
      if @part_type.update_attributes(params[:part_type])
        format.html { redirect_to(@part_type, :notice => 'Part type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @part_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /part_types/1
  # DELETE /part_types/1.xml
  def destroy
    @part_type = PartType.find(params[:id])
    @part_type.destroy

    respond_to do |format|
      format.html { redirect_to(part_types_url, :notice => 'Part type was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end

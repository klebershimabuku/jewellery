class UsersController < ApplicationController
  
  load_and_authorize_resource
  
  def index
    @users = User.order('updated_at DESC').page params[:page]
  end
  
  def new
    @user = User.new
    if user_signed_in?
      if current_user.role == "admin"
        @roles = %w[user manager]
      elsif current_user.role == "manager"
        @roles = 'user'
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if user_signed_in?
      if current_user.role == "admin"
        @roles = %w[manager user]
      elsif current_user.role == "manager"
        @roles = 'user'
      end
    end

  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(params[:user])
    
    if user_signed_in?
      if current_user.role == "admin"
        @roles = %w[manager user]
      elsif current_user.role == "manager"
        @roles = 'user'
      end
    end
    

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @part }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
    
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  

end

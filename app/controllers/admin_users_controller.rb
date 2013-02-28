class AdminUsersController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_login
  
  def index
  	list
  	render('list')
  end
  
  def list
  	@users = AdminUser.sorted
  end
  
  def new
	@user = AdminUser.new
  end
  
  def create
  	@user = AdminUser.new(params[:user])
  	if @user.save
  		flash[:notice] = "User saved"
  		redirect_to(:action => 'list')
  	else
  		render('new')
  	end
  end
  
  def edit
  	@user = AdminUser.find(params[:id])
  end
  
  def update 
  	@user = AdminUser.find(params[:id])
  	if @user.update_attributes(params[:user])
  		redirect_to(:action => 'list')
  	else
  		render('edit')
  	end
  end
  
  def delete
  	@user = AdminUser.find(params[:id])
  end
  
  def destroy
  	AdminUser.find(params[:id]).destroy
  	flash[:notice] = "Item deleted."
  	redirect_to(:action => 'list')
  end
end

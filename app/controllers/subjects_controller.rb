class SubjectsController < ApplicationController

  layout 'admin'
  #if a person just types "/subjects into the address bar this will execute by default"
  def index
  	list
  	#this renders out the list view template, you can make it any other if you want 
  	render('list')
  end
  
  def list
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
  	@subject = Subject.find(params[:id])
  end
  
  def new
  	@subject = Subject.new
  end
  
  def create
  	#instantiate new object
  	@subject = Subject.new(params[:subject])
  	#if subject saves then redirect
  	if @subject.save
  		flash[:notice] = "New item created."
  		redirect_to(:action => 'list')
  	else
  		#error in saving, show new form to fix issues
  		render('new')
  	end
  end
  
  def edit
    #instance variable is bound to the form by form_for in the view code.
  	@subject = Subject.find(params[:id])
  end
  
  def update
  		@subject = Subject.find(params[:id])
  		if @subject.update_attributes(params[:subject])
  			flash[:notice] = "Item updated."
  			redirect_to(:action => 'show', :id => @subject.id)
  		else
  			render('edit')
  		end
  end
  
  def delete
    #instance variable is bound to the form by form_for in the view code.
  	@subject = Subject.find(params[:id])
  end
  
  def destroy
  	Subject.find(params[:id]).destroy
  	flash[:notice] = "Item deleted."
  	redirect_to(:action => 'list')
  end
end

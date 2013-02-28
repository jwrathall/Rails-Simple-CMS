class SectionsController < ApplicationController
	layout 'admin'
	
	before_filter :confirm_login
	
	def index
		list
		render('list')
	end
	
	def list
		@sections = Section.order("sections.position ASC")
	end
	
	def show
		@section = Section.find(params[:id])
	end
	
	def new
		@section = Section.new()
		@section_count = Section.count + 1
		@pages = Page.order('position ASC')
	end
	
	def create
		@section = Section.new(params[:section])
		if @section.save
			flash[:notice] = "New section added"
			redirect_to(:action => 'show', :id => @section.id)
		else
			@section_count = Section.count + 1
			@pages = Page.order('position ASC')
			render('new')
		end
	end
	
	def edit
		@section = Section.find(params[:id])
		@section_count = Section.count
		@pages = Page.order('position ASC')
	end
	
	def update
		@section = Section.find(params[:id])
		if @section.update_attributes(params[:section])
			flash[:notice] = "Item updated."
			redirect_to(:action => 'show', :id => @section.id)
		else
			@section_count = Section.count
			@pages = Page.order('position ASC')
			render('edit')
		end
	end
	
	def delete
		@section = Section.find(params[:id])
	end
	
	def destroy
		section = Section.find(params[:id]).destroy
	  	flash[:notice] = "Item deleted."
  		redirect_to(:action => 'list')
	end
end

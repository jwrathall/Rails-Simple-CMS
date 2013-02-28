class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #changed from private so all subclasses can use it
  protected
   
  def confirm_login
   	unless session[:user_id]
   		flash[:notice] = "Please login"
   		redirect_to(:controller => 'access', :action => 'login')
   		return false
   	else
   		return true
   	end
   end
end

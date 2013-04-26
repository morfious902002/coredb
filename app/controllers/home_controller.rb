class HomeController < ApplicationController
  def index
  	if !params[:q].blank?
    	@search = Database.where("name LIKE ?","%#{params[:q]}%")
    elsif !params[:app_name].blank?    	
    	@search2 = Application.where("name LIKE ?","%#{params[:app_name]}%")
    end 	
  end
    
  def about
  end

end

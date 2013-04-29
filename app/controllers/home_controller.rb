class HomeController < ApplicationController
  def index
  	if !params[:q].blank?
    	@search = Database.where("databases.name LIKE ?","%#{params[:q]}%").joins(:host).where("hosts.name LIKE ?", "%#{params[:db_admin]}%")
    elsif !params[:app_name].blank?    	
    	@search2 = Application.where("name LIKE ?","%#{params[:app_name]}%")
    end 	
  end
    
  def about
  end

end

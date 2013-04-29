class Application < ActiveRecord::Base
  attr_accessible :PBContactName, :PBContactNetID, :PBContactPhone, :PTContactName, :PTContactNetID, :PTContactPhone, :STContactName, :STContactNetID, :STContactPhone, :critical, :name
  has_many :schemas

  def application_name
  	application_name = self.name
  end
end

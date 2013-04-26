class Application < ActiveRecord::Base
  attr_accessible :PBContactName, :PBContactNetID, :PBContactPhone, :PTContactName, :PTContactNetID, :PTContactPhone, :STContactName, :STContactNetID, :STContactPhone, :critical, :name
end

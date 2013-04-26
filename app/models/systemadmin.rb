class Systemadmin < ActiveRecord::Base
  attr_accessible :id, :email, :location, :name, :netid, :priphone, :secphone
  has_many :primary_host_admin, :class_name => 'Host', :foreign_key => 'primary_host_id'
  has_many :secondary_host_admin, :class_name => 'Host', :foreign_key => 'secondary_host_id'

  validates :email, :format => /@/

  def sa_name1
  	sa_name1 = self.name
  end

  def sa_name2
  	sa_name2 = self.name
  end
end

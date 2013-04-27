class Dbadmin < ActiveRecord::Base
  attr_accessible :id, :email, :location, :name, :netid, :priphone, :secphone, :primary_dba
  has_many :primary_dba, :class_name => 'Database', :foreign_key => 'primary_dba_id'
  has_many :secondary_dba, :class_name => 'Database', :foreign_key => 'secondary_dba_id'

  #validates :email, :format => /@/

  def dba_name1
  	sa_name1 = self.name
  end

  def dba_name2
  	sa_name2 = self.name
  end
end

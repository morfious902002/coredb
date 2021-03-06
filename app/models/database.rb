class Database < ActiveRecord::Base
  attr_accessible :dbcreated_on, :drmethod, :host_id, :name, :port, :primary_dba_id, :secondary_dba_id, :server_id, :server_desc, :unique_hash, :version, :dba_name1, :dba_name2
  belongs_to :primary_dba, :class_name => 'Dbadmin', :foreign_key => 'primary_dba_id'
  belongs_to :secondary_dba, :class_name => 'Dbadmin', :foreign_key => 'secondary_dba_id'
  belongs_to :host, :class_name => 'Host'
  validates  :name, :presence => true
  validates  :dba_name1, :presence => true
  validates  :dba_name2, :presence => true
  validate   :dba_primary_secondary_validation
  has_many   :schemas
  
  
  def dba_name1
    primary_dba.try(:dba_name1)
  end
  
  def dba_name1=(dba_name1)
    self.primary_dba = Dbadmin.find_or_create_by_name(dba_name1) if dba_name1.present?
  end

  def dba_name2
    secondary_dba.try(:dba_name2)
  end
  
  def dba_name2=(dba_name2)
    self.secondary_dba = Dbadmin.find_or_create_by_name(dba_name2) if dba_name2.present?
  end

  def dba_primary_secondary_validation
    errors.add(:dba_name2, "cannot be same as Primary Database Admin.") if dba_name1 == dba_name2
  end

  def database_name
    database_name = self.name
  end
end

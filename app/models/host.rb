class Host < ActiveRecord::Base
  attr_accessible :iogroup, :ip, :location, :name, :opsystem, :primary_sadmin_id, :purpose, :secondary_sadmin_id, :host_type, :sa_name1, :sa_name2, :osName, :bit, :description, :virtualIP
  belongs_to :primary_sadmin, :class_name => 'Systemadmin', :foreign_key => 'primary_sadmin_id'
  belongs_to :secondary_sadmin, :class_name => 'Systemadmin', :foreign_key => 'secondary_sadmin_id'
  has_many   :database, :class_name => 'Host'
  
  validates :sa_name1, :presence => true
  validates :sa_name2, :presence => true
  validate :sa_primary_secondary_validation

  def sa_name1
    primary_sadmin.try(:sa_name1)
  end
  
  def sa_name1=(sa_name1)
    self.primary_sadmin = Systemadmin.find_or_create_by_name(sa_name1) if sa_name1.present?
  end

  def sa_name2
    secondary_sadmin.try(:sa_name2)
  end
  
  def sa_name2=(sa_name2)
    self.secondary_sadmin = Systemadmin.find_or_create_by_name(sa_name2) if sa_name2.present?
  end

  def sa_primary_secondary_validation
    errors.add(:sa_name2, "Cannot be same as Primary System Admin.") if sa_name1 == sa_name2
  end

end

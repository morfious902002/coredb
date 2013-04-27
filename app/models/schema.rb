class Schema < ActiveRecord::Base  
  attr_accessible :application_id, :database_id, :name, :size, :application_name, :database_name
  belongs_to :database , :class_name => 'Database'
  belongs_to :application , :class_name => 'Application'
  validates :database, :presence => true
  validates :application, :presence => true

  def application_name
    application.try(:application_name)
  end
  
  def application_name=(application_name)
    self.application = Application.find_or_create_by_name(application_name) if application_name.present?
  end

  def database_name
    database.try(:database_name)
  end
  
  def database_name=(database_name)
    self.database = Database.find_or_create_by_name(database_name) if database_name.present?
  end
  
end

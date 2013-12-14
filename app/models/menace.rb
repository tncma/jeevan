class Menace < ActiveRecord::Base
  include ActiveModel::Validations
  after_initialize lambda { |t| t.uuid ||= SecureRandom.uuid } #set uuid 
  attr_accessible :name, :email, :what, :where
  
  validates_presence_of :name, :what, :where
  validates :email, :presence => true, :email => true

  def to_param
    uuid
  end
end

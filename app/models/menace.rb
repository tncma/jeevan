class Menace < ActiveRecord::Base
  include ActiveModel::Validations
  after_initialize lambda { |t| t.uuid ||= SecureRandom.uuid } #set uuid 
  attr_accessible :name, :email, :what, :where, :status
  
  validates_presence_of :name, :what, :where
  validates :email, :presence => true, :email => true

  state_machine :status, :initial => :submitted do
    event :accept do
      transition :submitted => :accepted
    end

    event :reject do
      transition :submitted => :rejected
    end

    event :assign do
      transition :accepted => :assigned
    end

    event :finish do
      transition :assigned => :finished
    end
  end

  def to_param
    uuid
  end
end

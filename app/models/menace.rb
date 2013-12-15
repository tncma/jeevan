class Menace < ActiveRecord::Base
  include ActiveModel::Validations
  after_initialize lambda { |t| t.uuid ||= SecureRandom.uuid } #set uuid 
  attr_accessible :name, :email, :what, :where, :status

  has_many :transition_logs
  
  validates_presence_of :name, :what, :where
  validates :email, :presence => true, :email => true

  scope :submitted, -> { where(status: "submitted") }
  scope :accepted, -> { where(status: "accepted") }
  scope :assigned, -> { where(status: "assigned") }
  scope :rejected, -> { where(status: "rejected") }
  scope :finished, -> { where(status: "finished") }

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

    after_transition do |menace, transition|
      TransitionLog.create!(
        :from => transition.from,
        :to => transition.to,
        :menace_id => menace.id
      )
    end
  end

  def to_param
    uuid
  end
end

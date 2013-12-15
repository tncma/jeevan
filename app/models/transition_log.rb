class TransitionLog < ActiveRecord::Base
  attr_accessible :from, :to, :menace_id
  belongs_to :menace
end

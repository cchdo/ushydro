class CruisesParameter < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  has_one :cruise
  has_one :parameter
  has_many :events
end

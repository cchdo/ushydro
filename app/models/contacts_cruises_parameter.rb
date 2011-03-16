class ContactsCruisesParameter < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :cruises_parameters
  has_one :cruises, :through => :cruises_parameters
  has_one :parameters, :through => :cruises_parameters
end

class Cruise < ActiveRecord::Base
  has_many :parameters, :through => :cruises_parameters
  belongs_to :cruises_parameter
  belongs_to :ship
  belongs_to :port
end

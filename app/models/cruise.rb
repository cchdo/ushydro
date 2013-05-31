class Cruise < ActiveRecord::Base
  has_many :parameters, :through => :cruises_parameters
  belongs_to :cruises_parameter
  belongs_to :ship
  belongs_to :start_port, :class_name => "Port"
  belongs_to :end_port, :class_name => "Port"
end

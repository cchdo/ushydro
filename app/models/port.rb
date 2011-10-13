class Port < ActiveRecord::Base
  has_many :cruises, :through => :start_port
  has_many :cruises, :through => :end_port
end

class Ship < ActiveRecord::Base
 #has_and_belongs_to_many :cruises
 has_many :cruises
end

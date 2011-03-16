class Contact < ActiveRecord::Base
  has_and_belongs_to_many :cruises_parameters
  has_many :institutions
end

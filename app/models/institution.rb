class Institution < ActiveRecord::Base
  belongs_to_many :contacts
end

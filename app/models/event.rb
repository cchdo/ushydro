class Event < ActiveRecord::Base
  belongs_to :cruises_parameter
  attr_accessible :category, :date, :notes, :brief
  CATEGORIES = ["PI letter sent","preliminary data submitted", "update submitted","action needed","merge status"]
end

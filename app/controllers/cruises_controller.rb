class CruisesController < ApplicationController
  layout "standard"
  def index
    @cruises = Cruise.all() #, :order => "begin_date")  

  end
end

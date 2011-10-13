class Staff::CruiseParametersController < ApplicationController
  layout "standard"
   def show
  end

  def edit
    @cruise_param = CruisesParameter.new
  end

  def index
    @cruise_params = CruisesParameter.all
  end

  def new
  end

  def create
  end
end

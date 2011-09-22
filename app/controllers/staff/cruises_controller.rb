class Staff::CruisesController < ApplicationController
  before_filter :logged_in?
  layout  "standard"

  def index
    @cruises = Cruise.find(:all, :order=> "start_date")
    if params[:level]
      @parameters = Parameter.find(:all, :conditions =>["level = ?", params[:level]])
    else
      @parameters = Parameter.find(:all, :conditions =>['level = 1'])
    end
    if params[:sort]# and ['cruise_id','date','parameter_id'].include?(params[:sort])
      @sort = params[:sort]
    end
    @events = Event.all
  end

  def new
    @cruise = Cruise.new
  end

  def show
    if params[:id]
      @cruise = Cruise.find(params[:id])
    end
  end

  def edit
    if params[:id]
      @cruise = Cruise.find(params[:id])
    end
  end

  def update
    @cruise = Cruise.find(params[:id])
    if @cruise.update_attributes(params[:cruise])
      flash[:notice] = "Successfully updated cruise."
      redirect_to staff_cruises_path
    else
      render :action => 'edit'
    end
  end
 
  def destroy
  end 

  def create
    if params[:cruise]
      @new_cruise = Cruise.new(params[:cruise])
      respond_to do |format|
        if @new_cruise.save
          flash[:notice] = 'Cruise was successfully created.'
          format.html { redirect_to(staff_cruises_path) }
        else
          flash[:notice] = 'Cruise creation failed, please contact the USHydro staff.'
          format.html {redirect_to(root_path)}
        end
      end
    end
  end
end

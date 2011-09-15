class Staff::EventsController < ApplicationController

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
    @event = Event.new
  end

  def show
    if params[:id]
      @event = Event.find(params[:id])
    end
  end

  def edit
    if params[:id]
      @event = Event.find(params[:id])
      logger.info("Event : : :\n#{params[:id]}\n#{@event.inspect}\n"*2)
    end
  end

  def update
    @event = Event.find(params[:id])  
    cruise = Cruise.find(params[:event_form][:cruise])
    parameter = Parameter.find(params[:event_form][:parameter])
    if c_p = CruisesParameter.find_or_create_by_parameter_id_and_cruise_id(parameter.id,cruise.id)
      @event.cruises_parameter = c_p
    end
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to staff_events_path
    else
      render :action => 'edit'
    end
  end
 
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to staff_events_path, :notice => "Successfully destroyed event."
  end 

  def create
    if params[:event]
      puts "\n\nPARAMS{}{}\n"
      puts "#{params[:event]}\n"
      cruise = Cruise.find(params[:event_form][:cruise])
      parameter = Parameter.find(params[:event_form][:parameter])
      @new_event = Event.new(params[:event])
      puts "I expect these not to be 1:  #{cruise.id},  #{parameter.id} \n\n"*2
      puts "NEWe 1:  #{@new_event.inspect}\n\n"*2
      logger.info "I expect these not to be 1:  #{cruise.id},  #{parameter.id} \n\n"*2
      if c_p = CruisesParameter.find_or_create_by_parameter_id_and_cruise_id(parameter.id,cruise.id)
        @new_event.cruises_parameter = c_p
      end
      puts "Looking and found :#{cruise} with p=#{parameter}\n"*2
      respond_to do |format|
        if @new_event.save
          flash[:notice] = 'Event was successfully created.'
          format.html { redirect_to(staff_events_path) }
        else
          flash[:notice] = 'Event creation failed, please contact the USHydro staff.'
          format.html {redirect_to(root_path)}
        end

      end
    end
  end
end

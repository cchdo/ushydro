class Staff::EventsController < ApplicationController

  before_filter :logged_in?
  layout  "standard"
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    if params[:id]
      @event = Event.first(params[:id])
    end
  end

  def edit

  end

  def create
    if params[:event]

      cruise = Cruise.find(params[:event_form][:cruise])
      parameter = Parameter.find(params[:event_form][:parameter])
      @new_event = Event.new(params[:event])
      if c_p = CruisesParameter.find_or_create_by_parameter_id_and_cruise_id(parameter,cruise)
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

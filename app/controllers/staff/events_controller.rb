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
      @new_event = Event.new(params[:event])
      respond_to do |format|
        if @new_event.save
          flash[:notice] = 'Event was successfully created.'
          format.html { redirect_to(events_path) }
        else
          flash[:notice] = 'Event creation failed, please contact the USHydro staff.'
          format.html {redirect_to(root_path)}
        end

      end
    end
  end
end

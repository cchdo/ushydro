class PagesController < ApplicationController

    layout "standard"

    def cruises
        @cruises = Cruise.all(
            :include => [:ship, :start_port, :end_port],
            :conditions => ['start_date < ?', Date.today],
            :order => "start_date DESC")
        @future_cruises = Cruise.all(
            :include => [:ship, :start_port, :end_port],
            :conditions => ['start_date >= ?', Date.today],
            :order => "start_date DESC")  
    end

    def repeathydro_map
    end

end

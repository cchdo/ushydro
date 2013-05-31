class PagesController < ApplicationController

    layout "standard"

    def cruises
        @cruises = Cruise.all(
            :include => [:ship, :start_port, :end_port],
            :order => "start_date")  
    end

    def repeathydro_map
    end

end

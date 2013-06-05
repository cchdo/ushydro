class PagesController < ApplicationController

    layout "standard"

    ALLOWED_SORT_DIRS = ['ASC', 'DESC']

    def cruises
        sort_by = params[:sort]
        if sort_by == 'cruise'
            sort_col = 'name'
        elsif sort_by == 'dates'
            sort_col = 'start_date'
        elsif sort_by == 'expocode'
            sort_col = 'ExpoCode'
        elsif sort_by == 'days'
            sort_col = 'days'
        elsif sort_by == 'ship'
            sort_col = 'ships.name'
        elsif sort_by == 'stations'
            sort_col = 'stations'
        elsif sort_by == 'contact'
            sort_col = 'contact'
        else
            sort_col = 'start_date'
            params[:sort] = 'dates'
        end

        sort_dir = params[:sort_dir]
        unless ALLOWED_SORT_DIRS.include?(sort_dir)
            sort_dir = 'DESC'
        end

        @cruises = Cruise.all(
            :joins => [:ship],
            :include => [:ship, :start_port, :end_port],
            :conditions => ['start_date < ?', Date.today],
            :order => "#{sort_col} #{sort_dir}")
        @future_cruises = Cruise.all(
            :joins => [:ship], 
            :include => [:ship, :start_port, :end_port],
            :conditions => ['start_date >= ?', Date.today],
            :order => "#{sort_col} #{sort_dir}")
    end

    def repeathydro_map
    end

end

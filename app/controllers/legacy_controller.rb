class LegacyController < ApplicationController
    def cruises
        redirect_to cruise_path
    end

    def cruise_data_links
        redirect_to cruise_path
    end
end

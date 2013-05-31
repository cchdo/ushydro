module PagesHelper

    # A cruise is hidden if its start date year is 9999
    def cruises_hidden?(cruise)
        if cruise.start_date and cruise.start_date.year == 9999
            return true
        end
        return false
    end

    def cruises_link(cruise)
        if cruise.expocode
            link_to(
                cruise.name, "http://cchdo.ucsd.edu/cruise/#{cruise.expocode}")
        else
            cruise.name
        end
    end

    def reduce_port(cruise, port)
        if cruises_needs_reduction?(cruise)
            if port.country
                return port.country
            else
                return 'Unable to disclose'
            end
        else
            return port.name
        end
    end

    def cruises_port(cruise)
        ports = []
        if cruise.start_port
            ports << reduce_port(cruise, cruise.start_port)
        end
        if cruise.end_port
            ports << reduce_port(cruise, cruise.end_port)
        end
        ports.join(' - ')
    end

    def cruises_ship(cruise)
        if cruise.ship
            if cruise.ship.link
                link_to(cruise.ship.name, cruise.ship.link)
            else
                cruise.ship.name
            end
        else
            ''
        end
    end

    # Cruises involving UNOLS and NOAA ships after 2013-01-01 cannot display
    # ports of call and dates more specific than country and general part of
    # year when the cruise has not yet happened.
    #
    # General part of year map:
    # Early - Jan/Apr
    # Mid   - May/Aug
    # Late  - Sep/Dec
    #
    # Since all USHYDRO cruises are related to US ships, only check the years.
    def cruises_needs_reduction?(cruise)
        if cruise.start_date.blank?
            return false
        end
        if cruise.start_date >= Date.new(2013, 1, 1)
            if cruise.end_date
                return cruise.end_date >= Date.today()
            else
                return true
            end
        end
        return false
    end

    # If the cruise information needs reduction, only show the year and general
    # part of the year.
    #
    # Case A: Reduction necessary
    #   Case 1: Start date and end date are the same
    #     Only show the year
    #   Case 2: Start date and no end date
    #     Show general part of year
    # Case B: Reduction not necessary
    #   Show both complete dates
    def cruises_dates(cruise)
        if cruises_needs_reduction?(cruise)
            if cruise.start_date == cruise.end_date
                return cruise.start_date.year.to_s
            end
            general_part = ''
            month = cruise.start_date.month
            if month < 5
                general_part = 'Early'
            elsif month < 9
                general_part = 'Mid'
            else
                general_part = 'Late'
            end
            "#{general_part} #{cruise.start_date.year}"
        else
            cruise.start_date.to_s + \
            content_tag(:span, '/', :class => "datesep") + \
            cruise.end_date.to_s
        end
    end

end

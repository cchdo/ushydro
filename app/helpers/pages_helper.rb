module PagesHelper

    def cruises_header_sort(text, key, anchor=nil)
        if params[:sort] == key and params[:sort_dir] == 'ASC'
            sort_dir = 'DESC'
        else
            sort_dir = 'ASC'
        end

        newparams = params.merge(
            :sort => key, :sort_dir => sort_dir, :anchor => anchor)

        if params[:sort] == key
            if sort_dir == 'DESC'
                arrow = '&#8595;'
                title = 'sort descending'
            else
                arrow = '&#8593;'
                title = 'sort ascending'
            end
            text + link_to(arrow, newparams, :class => 'sortarrow', :title => title)
        else
            text + link_to('&#8597;', newparams, :class => 'sortarrow', :title => 'sort by column')
        end
    end

    # A cruise is hidden if its start date year is 9999
    def cruises_hidden?(cruise)
        if cruise.start_date and cruise.start_date.year == 9999
            return true
        end
        return false
    end

    def cruises_link(cruise, name=nil)
        if name.nil?
            name = cruise.name
        end
        if cruise.expocode
            link_to(name, "http://cchdo.ucsd.edu/cruise/#{cruise.expocode}")
        else
            name
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

    # If both dates are available, use them to calculate the days instead of
    # taking it from the table which may be dated.
    def cruises_days(cruise)
        if (not cruises_needs_reduction?(cruise) and cruise.start_date and
            cruise.end_date)
            cruise.end_date - cruise.start_date
        else
            cruise.days
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

    # Display the ship name as a link to the ship's webpage. If no webpage is
    # available, just show the ship name. The ship name should be shortened to
    # one word with the full name available on hover.
    def cruises_ship(cruise)
        if cruise.ship
            name = cruise.ship.name
            short_name = name.split()[-1]
            if cruise.ship.link
                if short_name != name
                    link_to(short_name, cruise.ship.link, :title => name)
                else
                    link_to(name, cruise.ship.link)
                end
            else
                if short_name != name
                    content_tag(:abbr, short_name, :title => name)
                else
                    name
                end
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
            content_tag(
                :span, cruise.start_date.to_s, :class => "date start") + \
            content_tag(:span, '/', :class => "datesep") + \
            content_tag(:span, cruise.end_date.to_s, :class => "date end") 
        end
    end

    def link(aaa)
        aaa =~ /<a href="(.*)">/
        $1
    end

    def underway_nav_link_summary(link)
        if link =~ /www.aoml.noaa.gov/
            summary = 'NOAA / AOML'
        elsif link =~ /cdiac.ornl.gov/
            summary = 'CDIAC'
        else
            summary = ''
        end
        link_to(summary, link)
    end

    def cruises_underway_nav_link(cruise)
        lll = cruise.underway_nav_link
        if lll =~ /^http/
            links = lll.split(',')
            links = links.map {|link| underway_nav_link_summary(link) }
            links.join(' ')
        elsif lll
            lll
        else
            ''
        end
    end

    def cruises_underway_adcp_link(cruise)
        lll = cruise.underway_adcp_link
        if lll
            link_to('UH', lll, :title => "University of Hawaii")
        else
            ''
        end
    end

    def cruises_lowered_adcp_link(cruise)
        lll = cruise.lowered_adcp_link
        if lll
            link_to('UH', lll, :title => "University of Hawaii")
        else
            ''
        end
    end

    def cruises_underway_meta_link(cruise)
        lll = cruise.underway_meta_link
        if lll
            link_to('FSU', lll, :title => "FSU Met. DAC")
        else
            ''
        end
    end

end

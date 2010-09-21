class MembersController < ApplicationController
  layout "standard"


def index
  
  
  
  ##### Country

#      @list_of_oversight_com_members = Committe_members.find(:all, :select => 'Distinct Country').collect {|country| country.Country}.compact.sort!


#      @list_of_os_com_members = Oversight_committee.find(:all)
      
      #@list_of_cruise = Members.find(:first)      
      
#      @names = @list_of_oversight_com_members.last_name

=begin  

##### Ship

      disallowed_names = ['', 'Ship Name']

      @list_of_ships = Cruise.find(:all, :conditions => {:Country => @country_choice}, :select => 'DISTINCT Ship_Name' ).collect {|ship| ship.Ship_Name}.compact.sort! - disallowed_names

      @list_of_ships.map! {|ship| ship.upcase }

  ##### Year


     @list_of_years = Cruise.find(:all, :select => 'DISTINCT Begin_Date').collect {|date| date.Begin_Date}.compact.sort

     @list_of_years.map! {|date| date.year }.uniq!



  ##### Table


      @cruises = Cruise.find(:all, :conditions => {:Ship_Name => @ship_choice })

=end
  
  
  
end
end

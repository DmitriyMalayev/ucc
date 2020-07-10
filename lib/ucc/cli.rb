require "tty-prompt"
prompt = TTY::Prompt.new

module Ucc
    class CLI
        attr_reader :prompt  
        def initialize
            @prompt = TTY::Prompt.new
            @input = "" 
        end 

        def start 
            puts "Welcome The Urgent Care Center Finder App"
            set_location 
            list_centers 
            ask_for_choice 
           
            while @input != "exit" && @input != "back"
                if @input == "list"
                    list_centers 
                elsif valid? 
                    puts UrgentCareCenter.find_by_number(@input).details
                else 
                    puts "Whoops! I didn't get that. Try again."
                end
                ask_for_choice
            end
            goodbye 
        end  

        def set_location 
            puts "Where would you like to find an Urgent Care Center?"
            @location = gets.strip
            UrgentCareCenter.load_by_location(@location)  
        end 

        def start_central_picker 
        end 

        def list_centers
            puts ""
            UrgentCareCenter.all.each.with_index(1) do |ucc, index|
                puts "#{index}. #{ucc.name}"
            end 
        end
        
        def list_choices
            puts "\nFor detailed information on a center, type it's number followed by enter"
            puts "To view the list again type 'list' followed by enter" 
            puts "To return to the main menu type 'back' followed by enter"
            puts "To exit simply type 'exit' followed by enter"  
        end 
        
        def ask_for_choice
            list_choices 
            @input = gets.strip  
        end 

        def valid?
            @input.to_i.between?(1, UrgentCareCenter.all.length)
        end 

        def goodbye
            puts "\nThanks for using Urgent Care Finder."
        end 
    end
end
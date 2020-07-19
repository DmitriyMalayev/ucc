require "tty-prompt"
prompt = TTY::Prompt.new

module Ucc
    class CLI 
        def start
            puts "Welcome To The Urgent Care Center Finder App".bold  
            puts "What's your name?" 
            
            @patient_name = gets.strip
            
            puts "\nIt's a pleasure to meet you #{@patient_name}"  

            set_location
            list_centers
            ask_for_choice
           
            while @input != "exit"
                if @input == "list"
                    list_centers 
                elsif valid? 
                    display_details(UrgentCareCenter.find_by_number(@input))
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

        def list_centers
            puts ""
            UrgentCareCenter.all.each.with_index(1) do |ucc, index|
                puts "#{index}.".bold + " #{ucc.name}" 
            end 
        end
        
        def list_choices
            puts "\nFor detailed information on a center, type it's number followed by enter"
            puts "To view the list again type 'list' followed by enter" 
            puts "To exit simply type 'exit' followed by enter"  
        end 

        def display_details(ucc_center) 
            puts "#{ucc_center.name} has #{ucc_center.review_count} reviews with an average rating of #{ucc_center.rating}." 
            puts "\nContact Info:".bold  
            puts ""
            puts ucc_center.location["display_address"] 
            puts ucc_center.display_phone  
         end

        def ask_for_choice
            list_choices 
            @input = gets.strip  
        end 

        def valid?
            @input.to_i.between?(1, UrgentCareCenter.all.length)
        end 

        def goodbye
            puts "\nThank You For Using Urgent Care Center Finder".bold 
        end 
    end
end

# CLI Class Responsibilities 
    # Interacts with the User 
    # Prints Out Prompts 
    # Takes Input 
    # Decides What To Do With Data 





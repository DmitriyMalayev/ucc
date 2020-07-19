require "tty-prompt"
prompt = TTY::Prompt.new

module Ucc
    class UrgentCareCenter  
        attr_accessor :id, :name, :review_count, :rating, :location, :price, :display_phone 

        @@all = [] 
        def initialize(attributes={})
            attributes.each do |attribute_name, attribute_value|
                if self.respond_to?("#{attribute_name}=")
                    self.send("#{attribute_name}=", attribute_value) 
                end 
             end 
        end

        def self.create_from_search_results(search_results)
            search_results.map do |ucc_hash| 
                UrgentCareCenter.new(ucc_hash)
            end 
        end  

        def self.load_by_location(location)
            location_based_search_results = API.yelp_search("urgent care center", location)
            @@all = UrgentCareCenter.create_from_search_results(location_based_search_results) 
        end
        
        def self.all
            @@all  
        end
        
        def self.find_by_number(number) 
            puts ""
            UrgentCareCenter.all[number.to_i - 1] 
        end
    end
end 

# UrgentCareCenter Class Responsibilities 
    # Describes The Objects That Are Created, Stored and Accessed 
        # What Are Their Attributes?
        # How Do We Display Them In A List? 
        # How Do We Display Details About Them?     
require "pry"

module Ucc 
  class API
    API_HOST = "https://api.yelp.com"     #base 
    SEARCH_PATH = "/v3/businesses/search"  #endpoints 
    BUSINESS_PATH = "/v3/businesses/"   #endpoints  
    def self.api_key 
      begin
        @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip      
      rescue 
        puts "Whoops! Looks like you haven't added your Yelp API key yet!"  
        puts "You can go sign up for one by following these instructions:" 
        puts "https://ultimateelementor.com/docs/get-yelp-api-key/."  
        puts "Once you're done, come back and paste your key in here:"
        
        @@key = gets.strip 
        return if @@key == "exit"
        File.open(File.expand_path("~/.yelp-api-key"), "w") do |file|
          file.print @@key
        end
      end
      @@key
    end

    def self.yelp_search(term, location)
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {term: term, location: location}
      response = HTTP.auth("Bearer #{api_key}").get(url, params: params) 
      JSON.parse(response)["businesses"]
    end
  end
end 

#JSON.parse(response) provides an array of hashes 
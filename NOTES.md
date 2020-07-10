 
# URGENT CARE CENTER 
The reason we have a separate class for additional information such as location. 
This helps us refers to classes by name within each other without having to prefix it.  
* API // CLI // API example 
If we try interacting outside the module we still need to prefix 

* self  
When you refer to self inside a method it always refers to the receiving object of that method call 
Either the Class if it's a class method. 
self inside of initialize refers to the instance that we are creating.  
If it's an instance method it will be the instance that it's called on.

* JSON 
We have an array of Hashes we want to create an array of instances. 
keys in JSON are strings. 
Do Not use key symbols or single quotes.   

If attributes has a default value of nil, it might break the code 
This is because iteration doesn't work with a default value of nil   

def self.create_from_search_results(search_results)
    search_results.map do |ucc_hash|
        UrgentCareCenter.new(ucc_hash)  ***Creates a new instance for each one***  
    end
end 

class UrgentCareCenter 
    def initialize(attributes={})
        attributes.each do |attribute_name, attribute_value| 
            self.send("#{attribute_name}=", attribute_value)    
            *** attribute_value is this way so it can be used as both an integer or a string ***
            *** self refers to the instance that we're creating ***
        end
    end 
end  















=begin 
API 

  #In self.yelp_search we use Class Constants to store a URL to avoid typos and errors. 

  #The Bearer token helps us use to api_key to authenticate with yelp and able to receive data via Yelp. 

  #The get method is a type of request that we're sending utilizing a url and parameters. 
  # The url is the endpoint "https://api.yelp.com/v3/businesses/search" 
  # The paarams: is a hash with key value pairs. 


  #IN SIMPLE TERMS 
  #API helps us put input in and get a requested output out  
  #Parameters are the input 

  #STORING THE API KEY FOR EXTRA SECURITY 
  #Rather than adding it in the code, we are adding the ability for a user to add their own api key. 
  #We will add a method that will store our api_key locally and will retrieve the key upon request. #It will be a hidden file.  

  # @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip   
  # .expand_path turns it to a full absolute path that is read, stripped of white spaces, and assigned to @@key   
  #open method returns the file object 
  #read method provides the contents of the file 

  
  #Remove API Key 
    #rm~/.yelp-api-key
  #If file isn't present ruby will try to load it but will not be able to.
  #This will produce an error and will stop the code from running.  

  #Because we don't want our code to stop if an error occurs we use this   
    # begin (runs in the beginning)
    # rescue (runs if there is an error (in begin) to help code continue). puts instructions.  
      #We then ask for the yelp key to be provided by the user and we add writable permissions and make the key print to terminal. This is how it saves to the computer. 
  #The last expression in the method is the key (no matter how it was done) 



# API 






  
#   module Ucc 
#     class Api  
#       API_HOST = "https://api.yelp.com"   
#       SEARCH_PATH = "/v3/businesses/search"
#       BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
  
#       def self.api_key 
#         # this method will retrieve the API KEY stored in a file called .yelp_api_key in our root 
#         # directory. If the file doesn't exist it will ask us to enter an API key to the terminal 
#         # and store our input in that file so that it will be read next time we run the program.
#         # We haven't worked with the File class before, so here are a couple of things to note:
#         # 1. If we try to open a file that doesn't exist we get an error.
#         # 2. If we want to create the file in that case, we can use the begin rescue syntax.
#         # 3. If we're able to open a file we can call the read method on it to get its content.
#         # 4. A couple extra notes: File.expand_path returns an absolute path and will allow us to use ~ which represents a user's home directory.
#         # 5. If the file doesn't exist, we'll want to take the user's input to get their API KEY and store it in a hidden file (one that starts with a .) in their home directory. 
#            This way it will be there the next time we run the program and they won't have to enter it again.
#         # 6. To create a new file, we can use the File.open method with a second argument, "w", giving us write permissions to the file. Then we can pass a block to this and puts out content into the file

#         begin
#           @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip
#         rescue 
#           puts "Whoops! Looks like you haven't added your Yelp API key yet! You can go sign up for one by following these instructions: https://ultimateelementor.com/docs/get-yelp-api-key/. Once you're done, come back and paste your key in here:"
#           @@key = gets.strip 
#           return if @@key == "exit"
#           File.open(File.expand_path("~/.yelp-api-key"), "w") do |file|
#             file.print @@key
#           end
#         end
#         @@key
#       end
  
#       def self.yelp_search(term, categories, location)
#         url = "#{API_HOST}#{SEARCH_PATH}"
#         params = {
#           term: term, 
#           categories: categories, 
#           location: location
#         }
#         response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
#         JSON.parse(response)["businesses"]
#       end
#     end
#   end 


# Ucc::CLI.new.yelp_search 

# Ucc::CLI.API.yelp_search("urgent care centers", "11374") 

=end 








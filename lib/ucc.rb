require "ucc/version"
require "ucc/api"
require "ucc/cli"
require "ucc/urgent_care_center" 
require "http"  


module Ucc
  class Error < StandardError; 
    # Your code goes here...
  end 
end




# Ucc::Api.yelp_search("Urgent Care Center", "Urgent Care", "11374")

#This file loads all other files, similar to environment. 
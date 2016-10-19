# This script contains JsonFormatter class, 
# which has common methods for the three json formatters. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


module News
  class JsonFormatter < Formatter
    # Call super to guarantee that our checks are run
    def initialize
      super
    end


    # Define extension type
    def extension
      "json"
    end


    # Return true for header
    def header?
      true
    end
  
  
    # Return true for footer
    def footer?
      true
    end
    

    # Return nothing but needed to prevent any error
    def header article; end
    
    
    # Return footer
    def footer article
      "        ]\n    }\n}"
    end
    
    
    # Check if the str has " in it and if it has, replace with '
    # to prevent json format from destroying
    def checkquoating str
      begin
        if str.include?"\""
          # replace " with '
          return str.gsub("\"", "'")
        else
          return str
        end
      rescue
        return str
      end
    end

  end
end



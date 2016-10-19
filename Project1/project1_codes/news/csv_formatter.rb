# This script contains CsvFormatter class, 
# which has common methods for the three csv formatters. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne

module News
  class CsvFormatter < Formatter
    
    # Call super to guarantee that our checks are run
    def initialize
      super
    end


    # Define extension type
    def extension
      "csv"
    end


    # Return true for header
    def header?
      true
    end


    # Return false for footer
    def footer?
      false
    end
  
    # Return nothing but needed to prevent any error
    def header article; end
 
  end
end


# This script contains TheAgeCsvFormatter class which is for formatting the given
# information in article object into a proper csv representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'

class TheAgeCsvFormatter < News::CsvFormatter

  # Call super to guarantee that our checks are run
  def initialize
    super
  end


  # Return canned header data
  def header article
    "title, summary, source, date, guid, isPermaLink"
  end



  # Return canned article representation
  def article_representation article
    
    # Get the attributes of the article as an array of strings
    arr = article.attributes.values.map(&:to_s)
    temp_arr =[]
    
    # Iterate attributes  
    arr.each do |ele|
      if ele.eql? ""
        # Do nothing for empty values
      elsif ele.include? ","
        #if there is ',' in value, quote it
        temp_arr << "\""+ele+"\""
      else
        temp_arr << ele
      end
   end
   
   #Return the representation after joining the values by comma
   temp_arr.join(', ')
  end
  
end
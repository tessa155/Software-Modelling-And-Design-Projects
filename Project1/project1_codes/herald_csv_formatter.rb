# This script contains GuardianCsvFormatter class which is for formatting the given
# information in article object into a proper csv representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'


class HeraldCsvFormatter < News::CsvFormatter
  
  # Call super to guarantee that our checks are run
  def initialize
    super
  end
  
  
  # Return canned header data
  def header article
    "author, title, summary, images, source, date, guid"
  end


  # Return canned article representation
  def article_representation article
    # Get the attributes of the article as an array of strings
    arr = article.attributes.values.map(&:to_s)
    temp_arr =[]
    
    # Iterate attributes    
    arr.each do |ele|
      if ele.include? ","
        # If there is ',' in the value, quote it
        temp_arr << "\""+ele+"\""
      elsif ele.eql?""
        # If it is empty value, then put "null"
        temp_arr << "null"
      else
        temp_arr << ele
      end
   end

   #Return the representation after joining the values by comma
   temp_arr.join(', ')
  end
  
end
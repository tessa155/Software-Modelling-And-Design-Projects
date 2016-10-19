# This script contains HeraldJsonFormatter class which is for formatting the given
# information in article object into a proper json representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'


class HeraldJsonFormatter < News::JsonFormatter
  
  # Set the static flag to check if ',' should be printed
  # before the article representation (Only the first article is not printed with this comma)
  @@fomrer_was_header = false;
  
  
  # Call super to guarantee that our checks are run
  def initialize
    super
  end


  # Return the header
  def header article
    # Set the flag as ture
    @@former_was_header = true
    "{\n    \"articles\": {\n        \"article\": [\n"
  end


  # Return canned article representation
  def article_representation article
    # Get the values of the article
    hash_source = article.attributes
    
    # If this article is not the first one, then put comma before
    # to seperate with the former article representation
    if @@former_was_header == true
      result = "            {\n"
      @@former_was_header = false
    else
      result = ",\n            {\n"
    end
   
    # Get the keys from the hash table
    key_arr = hash_source.keys
    len = key_arr.length
    
    # Iterate the keys
    key_arr.each do |ele|
      # If the value of the key is not nil, put it into result
      if(hash_source[ele] != nil)
        # Check if there is " in it
        value = checkquoating hash_source[ele]
        temp = "                \"#{ele}\": \"#{value}\""
      # If the value is nil, then print null
      else
        temp = "                \"#{ele}\": null"
      end
      
      # If this element is the last one, then omit comma before it
      if ele == key_arr[len-1]
        temp+="\n"
      else
        temp+=",\n"
      end
      
      # Put the complete temp string for this attribute into result
      result+=temp
    end
   
    # Close the bracket  
    result+= "            }"
  end
  
end


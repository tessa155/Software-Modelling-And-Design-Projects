# This script contains TheAgeJsonFormatter class which is for formatting the given
# information in article object into a proper json representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'


class TheAgeJsonFormatter < News::JsonFormatter
  
  # Set the static flag to check if ',' should be printed
  # before the article representation (Only the first article is not printed with this comma)
  @@fomrer_was_header = false;

  
  # Call super to guarantee that our checks are run
  def initialize
    super
  end


  # Return header
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
    # Set 'count' variable to make this loop stop at 5th attribute
    count = 0
    key_arr.each do |ele|
      # If the first 4 attributes are done, break this loop
      if count > 5
        break
      end
      
      # If the value of the key is not nil, put it into result
      if(hash_source[ele] != nil)
        # Check if there is " in it
        value = checkquoating hash_source[ele]
        temp = "                \"#{ele}\": \"#{value}\""
        
        # If this element is the last one, then omit comma before it
        if ele == key_arr[len-1]
          temp+="\n"
        else
          temp+=",\n"
        end
        # Put the temp string for this attribute into result
        result+=temp
      end
      count+=1
    end   
     
    # Get the value of guid and isPermaLink
    guid = hash_source[key_arr[len-1]]
    isPermaLink = hash_source[key_arr[len-2]]
    
    # put guid value and isPermaLink values in one attribute to follow the original format
    result+="                \"guid\": {\n"
    result+="                    \"@isPermaLink\": \"#{isPermaLink}\",\n"
    result+="                    \"#test\": \"#{guid}\"\n"
    result+="                    }\n"
     
    # Close the bracket  
    result+= "            }"

  end
end


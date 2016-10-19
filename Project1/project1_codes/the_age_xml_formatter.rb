# This script contains TheAgeXmlFormatter class which is for formatting the given
# information in article object into a proper xml representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'


class TheAgeXmlFormatter < News::XmlFormatter

  # Call super to guarantee that our checks are run
  def initialize
    super
  end


  # Return canned article representation
  def article_representation article
    # Get the hash table which contains information
    hash_source = article.attributes
    
    # Get the key arrays of the hash table
    key_arr = hash_source.keys
    len = key_arr.length
    
    # Start with article tag     
    result = "    <article>\n"
    
    # Iterate the keys
    # Set 'count' variable to make this loop stop at 5th attribute
    count = 0
    key_arr.each do |ele|
      # If the first 4 attributes are done, break this loop
      if(count>5)
        break
      end
      
      # If the value is not nil then put it into result
      if(hash_source[ele] != nil)
        # convert inappropriate symbols into entities
        key = convertEntities(ele)
        value = convertEntities(hash_source[ele])
        temp = "        <#{key}>#{value}</#{key}>\n"
        result+=temp
      end
      count+=1
    end
    
    #put guid and isPermaLink in one tag as the original source
    guid = hash_source[key_arr[len-1]]
    isPermaLink = hash_source[key_arr[len-2]]
    result += "        <guid isPermaLink=\"#{guid}\">"
    result+="#{isPermaLink}</guid>\n"
       
    # Return the representation with closing article tag     
    result += "    </article>\n"
  end
end



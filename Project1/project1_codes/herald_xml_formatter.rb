# This script contains HeraldXmlFormatter class which is for formatting the given
# information in article object into a proper xml representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'


class HeraldXmlFormatter < News::XmlFormatter

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
        
    # Start with article tag    
    result = "    <article>\n"
    
    # Iterate keys in the hash_source
    key_arr.each do |ele|
      # convert inappropriate symbols into entities
      key = convertEntities(ele)
      
      # If the value is not nil, then put the value with tags into result
      if(hash_source[ele] != nil)
        value = convertEntities(hash_source[ele])
        temp = "        <#{key}>#{value}</#{key}>\n"
      # If the value in nil, then put only tags into result
      else
        temp = "        <#{key}></#{key}>\n"
      end
      result+=temp  
    end   
     
    # Return the representation with closing article tag
    result += "    </article>\n"
  end
end



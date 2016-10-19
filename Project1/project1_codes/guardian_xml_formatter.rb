# This script contains GuardianXmlFormatter class which is for formatting the given
# information in article object into a proper xml representation. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import the news scraper
require_relative 'news.rb'

class GuardianXmlFormatter < News::XmlFormatter

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
      # If the value is not nil then put it into result
      if(hash_source[ele] != nil)
        # Convert not-allowed symboles in xml into entities
        key = convertEntities(ele)
        value = convertEntities(hash_source[ele])
        temp = "        <#{key}>#{value}</#{key}>\n"
        result+=temp
      end
    end
    
    # Return the representation with closing article tag    
    result += "    </article>\n"
  end
end



# This script contains TheAgeArticle class which is a subclass of Article class.
# 2 more extra information can be stored with this(guid, isPermaLink).
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne



module News
  
  class TheAgeArticle < Article
    attr_reader :guid, :isPermaLink
    
    # Initialize the news article, using named paraters to associate
    # the author, title, summary, images, source, date, guid, isPermaLink
    def initialize author: nil, title: nil, summary: nil, images: nil, source: nil, date: nil, guid: nil, isPermaLink: nil
      @author = author
      @title = title
      @summary = summary
      @images = images
      @source = source
      @date = date
      @guid = guid
      @isPermaLink = isPermaLink
    end


    # Returns all of the attributes of an article as a hash.
    def attributes
      hash = super
      temp = {
        "guid" => @guid,
        "isPermaLink" => @isPermaLink
        }
      hash.merge(temp)
    end
    
  end
  
end

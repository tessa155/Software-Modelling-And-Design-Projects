# This script contains HeraldArticle class which is a subclass of Article class.
# one more extra information can be stored with this(guid).
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne



module News
  
  class HeraldArticle < Article
    attr_reader :guid
    
    # Initialize the news article, using named paraters to associate
    # the author, title, summary, images, source, date, guid
    def initialize author: nil, title: nil, summary: nil, images: nil, source: nil, date: nil, guid: nil
      @author = author
      @title = title
      @summary = summary
      @images = images
      @source = source
      @date = date
      @guid = guid
    end


    # Returns all of the attributes of an article as a hash.
    def attributes
      hash = super
      temp = {
        "guid" => @guid
        }
      hash.merge(temp)
    end
    
  end
  
end

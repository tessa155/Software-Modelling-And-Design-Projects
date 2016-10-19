# This script contains GuardianArticle class which is a subclass of Article class.
# 5 more extra information can be stored with this(type, sectionID, id, apiUrl, section_name).
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne



module News 
  class GuardianArticle < Article
    
    attr_reader :type, :sectionID, :id, :apiUrl, :sectionName
    
    # Initialize the guardian article, using named paraters to associate
    # the author, title, summary, images, source, date, type, 
    # sectionID, id, apiUrl, section_name
    def initialize author: nil, title: nil, summary: nil, images: nil, source: nil,
       date: nil, type: nil, sectionID: nil, id: nil, apiUrl: nil, section_name: nil
      @author = author
      @title = title
      @summary = summary
      @images = images
      @source = source
      @date = date
      @type = type
      @sectionID = sectionID
      @id = id
      @apiUrl = apiUrl
      @section_name = section_name
    end


    # Returns all of the attributes of an article as a hash.
    def attributes
      hash = super
      temp = {
        "type" => @type,
        "sectionID" => @sectionID,
        "id" => @id,
        "apiUrl" => @apiUrl,
        "section_name" => @section_name
        }
      hash.merge(temp)
    end   
  end
  
end

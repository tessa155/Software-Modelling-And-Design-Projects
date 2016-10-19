# This script contains TheAgeImporter class which is for parsing each article from
# the given source and storing the information in HeraldArticle object
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne


# Import required libraries
require 'Date'
require 'rss'
require 'open-uri'
require_relative 'news.rb'


class TheAgeImporter < News::Importer

  # We call super in the initialize method
  def initialize start_date, end_date
    super
  end


  # Define the class method for file_name, this should
  # return something similar to the name for your importer
  def self.source_name
    "the_age_source"
  end


  # Define a scrape method that saves canned article data
  def scrape
    # Define the url
    url = 'http://www.theage.com.au/rssheadlines/top.xml'
    
    # Open the url and parse the rss feed
    open(url) do |rss|
      # Start parsing
      feed = RSS::Parser.parse(rss, false)
      
      # Iterate each item and scrape information
      feed.items.each do |item|
        temp = News::TheAgeArticle.new(
          author: nil,
          title: item.title,
          summary: item.description,
          images: nil,
          source: item.link,
          date: item.pubDate,
          guid: item.guid.content,
          isPermaLink: item.guid.isPermaLink
        )
        
        # Put the object into articles array
        @articles << temp
      end
      
    end
    # Return the array of articles
    @articles
  end
  
end
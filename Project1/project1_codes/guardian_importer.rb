# This script contains GuardianImporter class which is for parsing each article from
# the given source and storing the information in GuardianArticle object
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne



# Import required libraries
require 'Date'
require 'open-uri'
require 'json'
require 'net/http'
require_relative 'news.rb'


class GuardianImporter < News::Importer

	# We call super in the initialize method
	def initialize start_date, end_date
		super
	end


	# Define the class method for file_name, this should
	# return something similar to the name for your importer
	def self.source_name
		"guardian_source"
	end


	# Define a scrape method that saves canned article data
	def scrape
    # Define the URL
    url = "http://content.guardianapis.com/search?api-key=uggudpb34qwz47bxb3rn7e4q&page=1&page-size=100"
    start_date = @start.strftime("%Y-%m-%d")
    end_date = @end.strftime("%Y-%m-%d")
    url += '&from-date=' + start_date + '&to-date=' + end_date
   
    # Define the HTTP object
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)

    # Get the response 
    response = http.get(uri)
    
    # Parse the response body
    forecast = JSON.parse(response.body)

    # Start parsing and store information in GuardianArticle object
    forecast['response']['results'].each do |each_article|
      temp = News::GuardianArticle.new( 
        author: nil,
        title: each_article["webTitle"],
        summary: nil,
        images: nil,
        source: each_article["webUrl"],
        date: each_article["webPublicationDate"],
        type: each_article["type"],
        sectionID: each_article["sectionId"],
        id: each_article["id"],
        apiUrl: each_article["apiUrl"],
        section_name: each_article["sectionName"]
      )
      
      # put this article into the array of articles
      @articles << temp
    end
    
    # Return the array of articles
    @articles
	end
	
end
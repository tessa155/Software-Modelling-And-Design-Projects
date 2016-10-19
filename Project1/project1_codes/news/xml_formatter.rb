# This script contains XmlFormatter class, 
# which has common methods for the three xml formatters. 
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne

module News
  class XmlFormatter < Formatter
    
    # Call super to guarantee that our checks are run
    def initialize
      super
    end


    # Define extension type
    def extension
      "xml"
    end


    # Return true for header
    def header?
      true
    end


    # Return true for footer
    def footer?
      true
    end


    # Return the header
    def header article
      "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<articles>\n"
    end


    # Return the footer
    def footer article
      "</articles>\n"
    end


    # Convert some symbols into proper entities to preserve xml format
    def convertEntities str
      if str == nil
        return
      end
    
      begin
        # Substitute &, <, > into entities
        str.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;")
      rescue
        return str
      end
    end

  end
end


    
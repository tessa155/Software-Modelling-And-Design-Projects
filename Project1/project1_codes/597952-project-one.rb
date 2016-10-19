# This is the main driver script to produce 9 files from 3 different sources in total
#
#
# Author::  Tessa(Hyeri) Song (songt@student.unimelb.edu.au)
# Student Number::  597952
# Copyright:: Copyright (c) 2015 The University Of Melbourne



# Import the news scraper
require_relative 'news'

# Import the guadian importer and formatters
require_relative 'guardian_importer.rb'
require_relative 'guardian_csv_formatter.rb'
require_relative 'guardian_xml_formatter.rb'
require_relative 'guardian_json_formatter.rb'

# Import the herald importer and formatters
require_relative 'herald_importer.rb'
require_relative 'herald_csv_formatter.rb'
require_relative 'herald_xml_formatter.rb'
require_relative 'herald_json_formatter.rb'

# Import the age importer and formatters
require_relative 'the_age_importer.rb'
require_relative 'the_age_csv_formatter.rb'
require_relative 'the_age_xml_formatter.rb'
require_relative 'the_age_json_formatter.rb'



# Implement a news scraper for csv format
scraper_csv = News::Scraper.new
# Register the source and importer/formatter
scraper_csv.register_source :guardian_source, GuardianImporter, GuardianCsvFormatter
scraper_csv.register_source :herald_source, HeraldImporter, HeraldCsvFormatter
scraper_csv.register_source :the_age_source, TheAgeImporter, TheAgeCsvFormatter
# Run the scrape
scraper_csv.scrape


# Implement a news scraper for xml format
scraper_xml = News::Scraper.new
# Register the source and importer/formatter
scraper_xml.register_source :guardian_source, GuardianImporter, GuardianXmlFormatter
scraper_xml.register_source :herald_source, HeraldImporter, HeraldXmlFormatter
scraper_xml.register_source :the_age_source, TheAgeImporter, TheAgeXmlFormatter
# Run the scrape
scraper_xml.scrape


# Implement a news scraper for jason format
scraper_json = News::Scraper.new
# Register the source and importer/formatter
scraper_json.register_source :guardian_source, GuardianImporter, GuardianJsonFormatter
scraper_json.register_source :herald_source, HeraldImporter, HeraldJsonFormatter
scraper_json.register_source :the_age_source, TheAgeImporter, TheAgeJsonFormatter
# Run the scrape
scraper_json.scrape

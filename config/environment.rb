#This page was setup to make code easier to read and access, using standard folder structure (config) and descriptive file name (environment)

require 'pry' # for testing
require 'nokogiri' # for scraping kickstarter website
require 'open-uri' # for scraping kickstarter website

# require all files in lib directory
require_relative '../lib/newest_kickstarter/version'
require_relative '../lib/newest_kickstarter/project'
require_relative '../lib/newest_kickstarter/cli'


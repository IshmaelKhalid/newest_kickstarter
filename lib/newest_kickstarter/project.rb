class NewestKickstarter::Project
  attr_accessor :name, :url, :summary, :author
  # reader and writer methods for my project properties

  # Initialize new projects with a name and url 
  # Set to nil if not provided
  def initialize(name = nil, url = nil)
    # Set instance variables for project properties
    @name = name
    @url = url
  end

  def self.all
    # fetch all projects if available or scrape KS
    @@all ||= scrape_newest_projects
  end

  def self.find(id)
    # find method that searches all projects by index
    # [id-1] for offset, id starts @ 1, index starts @ 0
    self.all[id-1]
  end

  def summary
    # fetch summary if available or search doc and retrieve
    @summary ||= doc.search("p.h3").text.strip
  end

  def author
    # fetch author if available or search doc and retrieve
    @author ||= doc.search('h5.mobile-hide a[data-modal-class="modal_project_by"]').text.strip
  end

  private
    # scrape method for kickstarter projects
    def self.scrape_newest_projects
      # Set doc variable for all html scraped from KS Page
      doc = Nokogiri::HTML(open('https://www.kickstarter.com/discover/advanced?recommended=false&sort=newest'))
      # Set names variable for all project names scraped from doc
      names = doc.search('h6.project-title a[data-score="null"]')
      # iterate through names variable, collect name text, and url
      # instantiate new project with name text and url for each pair
      names.collect{|e| new(e.text.strip, "https://www.kickstarter.com#{e.attr("href").split("?").first.strip}")}
      # Split at "?", take first part and remove whitespace
    end

    # Set doc variable for all html scraped from an objects url
    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
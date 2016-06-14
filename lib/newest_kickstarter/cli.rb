class NewestKickstarter::CLI
  
  def start # Dictates the flow and order of my gem  
    list # Call Scraping Method
    menu # Call Interactive Method
    goodbye # Call Closing Method
  end

  def list # Scraping Method
    puts "" #Skips Line
    puts "************* (Top 20) Newest Kickstarter Projects *************" # List Title
    puts "" #Skips Line
    #Call .all method on Project Class, take each with index and puts
    NewestKickstarter::Project.all.each.with_index(1) do |project, i|
      puts "#{i}. #{project.name}" 
      #format: 1. blahblah (then skips line, for each project)
    end
    puts "" #Skips Line
  end

  def menu # Interactive Method
    input = nil # Define input for while method on next line
    while input != "exit" #run this code unless user inputs exit
      # Ask user for specific input
      puts "Enter the number of the project you would like more info on, or type list for projects, or type exit"
      #recieve user input, remove whitespace, and make lowercase
      input = gets.strip.downcase
      # Start Case Method based on user input
      case input
      when "list"
        list # Run list method, then prompt question again
      else #check if its a number, and add if statment
        new_input = nil # Define new_input in case next line breaks
        new_input = input.to_i # make user input a number
        # check if user input a number between 1-20
        if new_input.between?(1,20)
          # take user input and run .find method on Project class
          project = NewestKickstarter::Project.find(new_input)
          # check if user input a number between 1-20 and i so
          #run more_info method with an argument of the project
          more_info(project)
          # Then prompt question again
        else # if user input is not a number between 1-20
          puts "Oops!"
          # Then prompt question again
        end
      end
    end
  end

  def more_info(project)
    puts "" #Skips Line
    # Run .name method on searched project
    puts "-------------- #{project.name} --------------" 
    puts "" #Skips Line
    # Run .summary method on searched project
    puts project.summary
    puts "" #Skips Line
    # Run .author method on searched project
    puts "Author: #{project.author}"
    puts "" #Skips Line
    # Run .url method on searched project
    puts "URL: #{project.url}"
    puts "" #Skips Line
    # Then prompt question again
  end

  def goodbye # Closing Method
    # Signal to the user that CLI has ended
    puts "Thanks for stopping by. See you later for more projects!"
  end

end
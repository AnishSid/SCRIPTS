require 'restaurant'
class Guide

  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_exists?
      puts "Found Restaurant File"
    elsif Restaurant.create_file
      puts "Created Restaurant File"
    else
      puts "Exiting!.\n\n"
      exit!
    end
  end

  def launch!
   introduction
   loop do
    print "> "
    user_response = gets.chomp
    result = do_action(user_response)
    break if result == :quit
   end
   conclusion
  end
    conclusion
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing.."
    when 'find'
      puts "Finding.."
    when 'add'
      puts "Adding.."
    when quit
      return :quit
    else
      puts "\nI dont understand that command.\n"
    end
  end


  def introduction

  def conclusion

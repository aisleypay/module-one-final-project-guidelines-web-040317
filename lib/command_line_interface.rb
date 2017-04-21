require 'terminal-table'
require 'colorize'

#This class is for all things related to user interaction on the CLI.
class CommandLineInterface
  def self.welcome
    puts '.-----------------------------------------.'.red
    puts '|-------  Get Your Representatives -------|'
    puts '|-------        Information!       -------|'
  end

  def self.get_address_from_user
    puts '==========================================='.blue
    puts '|~~      Please Enter: City, State      ~~|'
    puts '|~~~~        (Ex: Boston, MA)        ~~~~~|'
    puts '._________________________________________.\n'.red

    address = gets.chomp
  end

  def self.list_officials(api_hash, address)
    puts '.-----------------------------------------.'.red
    puts '-------------------------------------------'.red
    puts '--- Please Select an Official From List ---'
    puts '.-----------------------------------------.'.red
    puts '-------------------------------------------'.red

    Office.get_offices(api_hash)
    Official.get_officials(api_hash, address)
    gets.chomp.to_i - 1 # choice is a number
  end

  def self.user_choices(choice, address)
    until choice == 4
      puts '-----------------------------------------'.blue
      puts '-----------   Choose a Number    --------'
      puts '.---------------------------------------.'.blue
      puts '|  [ 1.]  Select New Representative.    |'.blue
      puts '|  [ 2.]  Select New City, State        |'.blue
      puts '|  [ 3.]  View Interesting Facts        |'.green
      puts '|  [ 4.]  Quit                          |'.red
      puts '.---------------------------------------.'.blue

      choice = gets.chomp.to_i

      case choice
      when 1
        choice = ApiAdaptor.show_representative_information(address)
        official_info = Official.display_official_info(choice, address)
        official_info

      when 2
        address = CommandLineInterface.get_address_from_user
        choice = ApiAdaptor.show_representative_information(address)
        official_info = Official.display_official_info(choice, address)
        official_info

      when 3
        puts "Did you know?\n\n"
        fun_methods = [Official.top_5_states_officials_count, Official.party_tally, Office.governors, OfficeOfficial.top_5_offices]
        fun_methods.sample
      when 4
        puts '.-----------------------------------------.'.red
        puts '-------------------------------------------'.red
        puts '---------- Come Back Soon! ----------------'.blue
        puts '.-----------------------------------------.'.red
        puts '-------------------------------------------'.red
      else
        puts 'MAKE A CHOICE FOOL wtf...'
      end
    end
  end
end

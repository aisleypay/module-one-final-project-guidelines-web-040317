def welcome
  puts "Get your Representatives information here!"
end

def get_address_from_user
  puts "Which state would you like to get information about?"
  # puts "Kindly write the address is the following format: Street#, Street Name, City, State. Include what information you can, we will figure out the rest!"

  address = gets.chomp
    if address == nil
      puts "Invalid"
    else
  address
    end
end

# def specific_subject
#   puts "What would you specifically like to know about #{get_address_from_user}?"
#   subject_specfic = gets.chomp.downcase
# end

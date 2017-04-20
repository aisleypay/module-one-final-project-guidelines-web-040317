#!/usr/bin/env ruby

require_relative '../config/environment'

CommandLineInterface.welcome

address = CommandLineInterface.get_address_from_user
choice = ApiAdaptor.show_representative_information(address)
official_info = Official.display_official_info(choice)
puts official_info
puts ""

CommandLineInterface.user_choices(choice)

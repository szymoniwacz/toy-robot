#!/usr/bin/env ruby

require_relative "toy_robot_simulator/simulator"

if ARGV.length > 0
  abort("Invalid file name.") unless File.exist?(ARGV[0])
  commands = File.read(ARGV[0])
else
  puts "Please enter commands for robot (for instructions write 'help'):"
  commands = gets
  puts File.read(File.dirname(__FILE__) + '/../README.md') if commands == 'help'
end
abort("No commands entered.") if commands.empty?

puts "Entered commands: #{commands}"

commands_parser = CommandsParser.new(commands)
abort("Invalid commands.") unless commands_parser.commands_valid?

parsed_commands = commands_parser.parse
puts "Parsed commands: #{parsed_commands}"

simulator = Simulator.new(parsed_commands)

simulator.run!

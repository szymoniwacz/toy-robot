#!/usr/bin/env ruby

require_relative "toy_robot_simulator/simulator"

if ARGV.length > 0
  commands = File.read(ARGV[0])
else
  puts "Please enter commands for robot (for instructions write 'help'):"
  commands = gets
  puts File.read(File.dirname(__FILE__) + '/../README.md') if commands == 'help'
end

abort("No command entered.") if commands.empty?

simulator = Simulator.new(commands)

abort("Invalid commands.") unless simulator.commands_valid?

simulator.run!

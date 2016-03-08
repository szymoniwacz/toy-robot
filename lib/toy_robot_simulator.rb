#!/usr/bin/env ruby

require_relative "toy_robot_simulator/simulator"

if ARGV.length > 0
  abort("Invalid file name.") unless File.exist?(ARGV[0])
  commands = File.read(ARGV[0])
else
  puts "Please enter commands for robot:"
  commands = gets
end

Simulator.new(commands).run!

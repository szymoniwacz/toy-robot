require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :exercise_robot do
  puts "-------------------------------------------"
  puts "First example:"
  ruby"./lib/toy_robot_simulator.rb ./test_data/data1.txt"
  puts "-------------------------------------------"
  puts "Second example:"
  ruby "./lib/toy_robot_simulator.rb ./test_data/data2.txt"
  puts "-------------------------------------------"
  puts "Third example:"
  ruby "./lib/toy_robot_simulator.rb ./test_data/data3.txt"
  puts "-------------------------------------------"
  puts "Fourth example:"
  ruby "./lib/toy_robot_simulator.rb ./test_data/data4.txt"
  puts "-------------------------------------------"
end

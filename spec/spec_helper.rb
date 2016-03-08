$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

RSpec.configure do |config|
  config.before(:all, &:silence_output)
  config.after(:all,  &:enable_output)
end

public
# Redirects stderr and stout to /dev/null.txt
def silence_output
  @original_stderr = $stderr
  @original_stdout = $stdout
  $stderr = File.new(File.join(File.dirname(__FILE__), 'dev', 'null.txt'), 'w')
  $stdout = File.new(File.join(File.dirname(__FILE__), 'dev', 'null.txt'), 'w')
end

# Replace stderr and stdout so anything else is output correctly
def enable_output
  $stderr = @original_stderr
  $stdout = @original_stdout
  @original_stderr = nil
  @original_stdout = nil
end

# require 'rspec/rails'
# require 'webmocks'
require_relative '../lib/toy_robot_simulator/simulator.rb'

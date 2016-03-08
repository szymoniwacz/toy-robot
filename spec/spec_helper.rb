$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    # Redirects stderr and stout to /dev/null.txt
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    # Replace stderr and stdout so anything else is output correctly
    $stderr = original_stderr
    $stdout = original_stdout
  end
end

require_relative '../lib/toy_robot_simulator/simulator.rb'

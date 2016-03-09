require 'rubygems'
require 'rspec'
require 'yaml'
require 'nokogiri'
require 'pry'
require 'ffaker'
require 'securerandom'

require Dir.pwd + '/lib/page_objects/base_page.rb'
require Dir.pwd + '/lib/models/environment.rb'
require Dir.pwd + '/lib/models/test_config.rb'

# Require everything in the "lib" folders:
Dir[Dir.pwd + '/lib/**/**/*.rb'].each {|file| require file }

RSpec.configure do |config|

  config.before(:all) do
    $env_config = EnvironmentConfig.new(TestConfig.get_environment)
    $env_test_data = $env_config.get_variables
  end

  config.after(:each) do |example|
    if example.exception
      example.attach_file('screenshot', File.new(@browser.save_screenshot(File.join(Dir.pwd, "results/#{SecureRandom.uuid}.png"))))
    end
  end

end

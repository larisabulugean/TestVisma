require 'spec_helper'

def open_adoption_home_page
  @browser.navigate.to($env_test_data[:environment_urls][:adoption][:base_uri])
  sleep(2)
end

def open_ghost_home_page
  @browser.navigate.to($env_test_data[:environment_urls][:ghost][:base_uri])
  sleep(2)
end

def open_ghost_login_page
  @browser.navigate.to($env_test_data[:environment_urls][:ghost][:base_uri]+$env_test_data[:environment_urls][:ghost][:login])
  sleep(2)
end

def open_ghost_account_page
  @browser.navigate.to($env_test_data[:environment_urls][:ghost][:base_uri]+$env_test_data[:environment_urls][:ghost][:account_page])
  sleep(2)
end

def generate_email()
  return 'aut_' + SecureRandom.random_number(9999999999).to_s + '@mailinator.com'
end

def generate_name()
  return FFaker::Name.name
end

def generate_user_name()
  return FFaker::Name.first_name + SecureRandom.random_number(999).to_s
end

def generate_new_class_data
  class_data = {:class_name => 'Auto' + SecureRandom.random_number(99999).to_s,
                :description => 'edit class',
                :course_name => $env_test_data[:course_data][:course_name]}
  return class_data
end

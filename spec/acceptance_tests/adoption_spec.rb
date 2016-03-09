require 'spec_helper'

describe 'Adoption tests : ' do
  before(:each) { @browser = Fixtures::Setup.init_browser }

  after(:each) { Fixtures::Teardown.close(@browser, self) }

  it 'can successfully submit an adoption survey for the turtle' do
    open_adoption_home_page
    adoption_home_page = AdoptionHomePage.new(@browser)

    adoption_home_page.adoption_section.click
    expect(@browser.current_url).to match($env_test_data[:environment_urls][:adoption][:base_uri] + '/adoption.html')

    adoption_option_page = AdoptionOptionPage.new(@browser)
    adoption_option_page.select_date_today.click
    adoption_option_page.turtle_check.click

    expect(@browser.current_url).to match($env_test_data[:environment_urls][:adoption][:base_uri] + '/adoption_pass.html')

    adoption_pass_page = AdoptionPassPage.new(@browser)
    adoption_pass_page.name_input.send_keys(generate_name)
    adoption_pass_page.email_input.send_keys(generate_email)
    adoption_pass_page.address_input.send_keys("Some address, Nr.10 A")
    adoption_pass_page.postcode_input.send_keys("1234567890")

    adoption_pass_page.submit_button.click

    expect(@browser.current_url).to match($env_test_data[:environment_urls][:adoption][:base_uri] + '/adoption_pass_confirm.html')
  end
end



require 'spec_helper'

describe 'Ghost script: ' do
  before(:each) { @browser = Fixtures::Setup.init_browser }

  after(:each) { Fixtures::Teardown.close(@browser, self) }

  describe 'Ghost test' do
    before(:each){
      #create new account
      open_ghost_home_page
      @email_address = generate_email
      ghost_home_page = GhostHomePage.new(@browser)
      ghost_home_page.email_address.send_keys(@email_address)
      ghost_home_page.user_name.send_keys(generate_user_name)
      ghost_home_page.password.send_keys("password1")
      ghost_home_page.try_button.click
      expect(@browser.current_url).to match($env_test_data[:environment_urls][:ghost][:base_uri]+$env_test_data[:environment_urls][:ghost][:subscribe_trial])

      #go to account page and log out
      open_ghost_account_page
      ghost_account_page = GhostAccountPage.new(@browser)
      ghost_account_page.log_out_button.click
      expect(@browser.current_url).to match($env_test_data[:environment_urls][:ghost][:base_uri]+$env_test_data[:environment_urls][:ghost][:login])
    }

    it 'can successfully login, access support and search for specified information' do
      # login with new account
      open_ghost_login_page
      ghost_login_page = GhostLoginPage.new(@browser)
      ghost_login_page.username_input.send_keys(@email_address)
      ghost_login_page.password_input.send_keys("password1")
      ghost_login_page.login_button.click

      expect(@browser.current_url).to match($env_test_data[:environment_urls][:ghost][:base_uri]+$env_test_data[:environment_urls][:ghost][:subscribe_trial])

      #Click on support url and open support page
      ghost_trial_page = GhostTrialPage.new(@browser)
      ghost_trial_page.support_url.click

      expect(@browser.current_url).to match($env_test_data[:environment_urls][:ghost_support][:base_uri])

      #Search for required text
      ghost_support_page = GhostSupportPage.new(@browser)
      ghost_support_page.search_input.click
      ghost_support_page.search_input.send_keys("create new blog")

      ghost_support_page.search_button.click
      expect(@browser.current_url).to match($env_test_data[:environment_urls][:ghost_support][:base_uri] + "/?s=" + "create+new+blog")

      #find and open first blog post
      ghost_support_page.first_blog_post.click
      expect(@browser.current_url).to match($env_test_data[:environment_urls][:ghost_support][:base_uri] + "/create-new-ghostpro-blog")
    end
  end
 end



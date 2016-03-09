class Fixtures
  class Setup

    def self.init_browser(options = {})
      selenium_config = SeleniumConfig.new
      $bc = BrowserControl.new(selenium_config)
      browser = $bc.new_browser(TestConfig.get_browser)
      raise 'Could not create browser object' if browser.nil?

      browser.manage.window.maximize

      browser
    end
  end
  class Teardown

    def self.close(browser, example_group)
      begin
      ensure
        browser.quit unless browser.nil?
      end
    end

    def self.save_screenshot_on_failure(example_group, browser)
      return if example_group.example == nil || example_group.example.exception == nil
      begin
        saved_screenshot = browser.save_screenshot(File.join(Dir.pwd, "screen_shots/#{SecureRandom.uuid}.png"))
        example_group.attach_file('screenshot', saved_screenshot)
      rescue
        puts "Error saving screenshot for example #{example_group.example.full_description}"
      end
    end
  end

end
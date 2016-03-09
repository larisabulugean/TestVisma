require 'selenium-webdriver'
require 'json'
class BrowserControl
  attr_accessor :browser, :selenium

  def initialize(selenium)
    @selenium = selenium
    @browser = nil
  end

  def new_browser(test_browser_name)
    close_existing_browser
    puts 'running tests on local machine'
    set_local_browser(test_browser_name)
  end

  def close_existing_browser
    unless @browser.nil?
      @browser.quit
    end
  end

  def set_local_browser(browser_name)
    case browser_name
      when :chrome
        Selenium::WebDriver::Chrome::Service.executable_path = 'bin/chromedriver'
        @browser = Selenium::WebDriver.for browser_name,
                                           :switches => %w[--ignore-certificate-errors
                                                           --disable-popup-blocking
                                                           --disable-translate]
      when :safari
        @browser = Selenium::WebDriver.for browser_name
      when :ie
        # TODO support ie
        Selenium::WebDriver::Chrome::Service.executable_path = 'bin/iedriver'
        @browser = Selenium::WebDriver.for browser_name
      when :firefox
        @browser = Selenium::WebDriver.for browser_name
    end
  end
end
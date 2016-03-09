class Page
  attr_accessor :browser

  def initialize(browser)
    @browser = browser
  end

  def self.navigate_to(browser, page_url)
    page = self.new(browser)
    @browser.navigate.to(page_url)
    return page
  end
end

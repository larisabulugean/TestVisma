class GhostTrialPage < Page

  def initialize(browser)
    super(browser)
  end

  def support_url
    browser.find_element(:xpath, '//*[@id="main-menu"]/li[3]/a')
  end

end
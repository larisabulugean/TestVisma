class GhostAccountPage < Page

  def initialize(browser)
    super(browser)
  end

  def log_out_button
    browser.find_element(:css, '.logout')
  end

end
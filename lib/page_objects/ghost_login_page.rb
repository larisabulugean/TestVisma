class GhostLoginPage < Page

  def initialize(browser)
    super(browser)
  end

  def username_input
    browser.find_element(:id, 'login-username')
  end

  def password_input
    browser.find_element(:id, 'login-password')
  end

  def login_button
    browser.find_element(:css,'.button-save.login-button')
  end

end
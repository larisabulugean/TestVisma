class GhostSupportPage < Page

  def initialize(browser)
    super(browser)
  end

  def search_input
    browser.find_element(:id, 's')
  end

  def search_button
    browser.find_element(:id, 'searchsubmit')
  end

  def first_blog_post
    browser.find_element(:xpath, '//*[@id="post-408"]/h2/a')
  end

end
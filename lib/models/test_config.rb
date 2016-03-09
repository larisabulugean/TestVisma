class TestConfig
  def self.get_environment
    test_env = ENV['test_environment']
    case test_env
      when 'test'
        return :test
      when 'stage'
        return :stage
      when 'prod'
        return :prod
      else
        return :test
    end
  end

  def self.get_browser
    test_browser = ENV['test_browser']
    case test_browser
      when 'chrome'
        return :chrome
      when 'ie'
        return :ie
      when 'safari'
        return :safari
      else
        return :firefox
    end
  end
end
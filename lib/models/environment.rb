class EnvironmentConfig
  @env = {}

  def initialize(environment)
    file = "test_data/#{environment}_environment.yml"
    t = ERB.new(File.read(file))
    @env = YAML.load(t.result(binding).to_s)
  end

  def get_variables
    return @env
  end

end
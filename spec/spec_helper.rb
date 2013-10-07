# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each{|f| require f}

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  require 'guardiola'
  require 'fakeweb'

  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec
  FakeWeb.allow_net_connect = false

  config.after(:each) do
    FakeWeb.clean_registry
  end
end

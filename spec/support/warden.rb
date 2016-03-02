Warden.test_mode!
include Warden::Test::Helpers

RSpec.configure do |config|
  config.after { Warden.test_reset! }
end

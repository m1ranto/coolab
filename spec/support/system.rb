RSpec.configure do |config|
  config.before(:each, test: :system) do
    driven_by :rack_test
    # driven_by :selenium, using: :chrome
  end
end
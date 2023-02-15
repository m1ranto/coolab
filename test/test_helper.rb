ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Log in as a collaborator
  def log_in_as(collaborator)
    session[:collaborator_id] = collaborator.id
  end
end

class ActionDispatch::IntegrationTest
  # Log in as a collaborator for integration test
  def log_in_as(collaborator, password: 'password')
    post login_path, params: { email: collaborator.email, password: password }
  end
end
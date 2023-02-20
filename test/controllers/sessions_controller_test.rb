require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should not get new" do
    log_in_as collaborators(:miranto)
    get login_url
    assert_redirected_to root_url
  end

  test "should create session" do
    post login_url params: { email: 'miranto@email.com', password: 'password' }
    assert_redirected_to root_url
  end

  test "should destroy session" do
    log_in_as collaborators(:miranto)
    delete logout_url
    assert_redirected_to root_url
  end
end

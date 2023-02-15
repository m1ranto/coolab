require "test_helper"

class CollaboratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collaborator = collaborators(:one)
  end

  test "should get index" do
    log_in_as @collaborator
    get collaborators_url
    assert_response :success
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create collaborator" do
    assert_difference("Collaborator.count") do
      post collaborators_url, params: { collaborator: { email: 'collaborator@email.com', name: 'name', title: 'title', password: 'password' } }
    end

    assert_redirected_to collaborator_url(Collaborator.last)
  end

  test "should show collaborator" do
    log_in_as @collaborator
    get collaborator_url(@collaborator)
    assert_response :success
  end

  test "should get edit" do
    log_in_as @collaborator
    get edit_collaborator_url(@collaborator)
    assert_response :success
  end

  test "should update collaborator" do
    log_in_as @collaborator
    patch collaborator_url(@collaborator), params: { collaborator: { email: 'collaborator@email.com', name: 'name', title: 'title' } }
    assert_redirected_to collaborator_url(@collaborator)
  end

  test "should destroy collaborator" do
    log_in_as @collaborator
    assert_difference("Collaborator.count", -1) do
      delete collaborator_url(@collaborator)
    end

    assert_redirected_to collaborators_url
  end
end

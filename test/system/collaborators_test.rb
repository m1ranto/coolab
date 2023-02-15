require "application_system_test_case"

class CollaboratorsTest < ApplicationSystemTestCase
  setup do
    @collaborator = collaborators(:one)
  end

  test "visiting the index" do
    visit collaborators_url
    assert_selector "div"
  end

  test "should create collaborator" do
    visit signup_url

    fill_in "Email", with: @collaborator.email
    fill_in "Name", with: @collaborator.name
    fill_in "Title", with: @collaborator.title
    click_on "Create Collaborator"

    assert_text "Collaborator was successfully created"
  end

  test "should update Collaborator" do
    visit collaborator_url(@collaborator)
    click_on "Edit", match: :first

    fill_in "Email", with: @collaborator.email
    fill_in "Name", with: @collaborator.name
    fill_in "Title", with: @collaborator.title
    click_on "Update Collaborator"

    assert_text "Collaborator was successfully updated"
  end

  test "should destroy Collaborator" do
    visit collaborator_url(@collaborator)
    click_on "Destroy", match: :first

    assert_text "Collaborator was successfully destroyed"
  end
end

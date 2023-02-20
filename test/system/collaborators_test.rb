require "application_system_test_case"

class CollaboratorsTest < ApplicationSystemTestCase
  setup do
    @collaborator = collaborators(:miranto)
  end

  test "visiting the index" do
    visit collaborators_url
    assert_selector "h1", text: "Sign in to Coolab"

    fill_in "Email", with: @collaborator.email
    fill_in "Password", with: @collaborator.password
    click_on "Sign in"
  end

  test "should create collaborator" do
    visit signup_url

    fill_in "Name", with: 'Sys'
    fill_in "Title", with: 'DevOps'
    fill_in "Email", with: 'sys@email.com'
    fill_in "Password", with: 'password'
    click_on "Create Collaborator"

    assert_text "Collaborator was successfully created"
  end

  test "should update Collaborator" do
    visit login_url

    fill_in "Email", with: 'miranto@email.com'
    fill_in "Password", with: 'password'
    click_on "Sign in"

    visit collaborators_url
    visit collaborator_url(@collaborator)
    find("a.btn-dark").click

    fill_in "Name", with: 'Name updated'
    fill_in "Email", with: 'email@updated.com'
    fill_in "Title", with: 'Title updated'
    click_on "Update Collaborator"

    assert_text "Collaborator was successfully updated"
  end

  test "should destroy Collaborator" do
    visit login_url

    fill_in "Email", with: 'miranto@email.com'
    fill_in "Password", with: 'password'
    click_on "Sign in"

    visit collaborators_url
    visit collaborator_url(@collaborator)
    find("button.btn-danger").click

    assert_text "Sign in to Coolab"
  end
end

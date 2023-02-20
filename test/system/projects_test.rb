require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:coolab)

    visit login_url

    fill_in "Email", with: 'miranto@email.com'
    fill_in "Password", with: 'password'
    click_on "Sign in"

    visit projects_url
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    click_on "New project"

    fill_in "Name", with: 'Name created'
    fill_in "Description", with: 'Description created'
    click_on "Create Project"

    assert_text "Project was successfully created"
  end

  test "should update Project" do
    find("a.bi-pencil-square").click

    fill_in "Name", with: 'Name updated'
    fill_in "Description", with: 'Description updated'
    click_on "Update Project"

    assert_text "Project was successfully updated"
  end

  test "should destroy Project" do
    find("button.bi-trash").click

    assert_text "Project was successfully destroyed"
  end
end

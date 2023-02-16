require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:coolab)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "div"
  end

  test "should create project" do
    visit projects_url
    click_on "New project"

    fill_in "Collaborator", with: @project.collaborator_id
    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Create Project"

    assert_text "Project was successfully created"
  end

  test "should update Project" do
    visit project_url(@project)
    click_on "Edit", match: :first

    fill_in "Collaborator", with: @project.collaborator_id
    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Update Project"

    assert_text "Project was successfully updated"
  end

  test "should destroy Project" do
    visit project_url(@project)
    click_on "Destroy", match: :first

    assert_text "Project was successfully destroyed"
  end
end

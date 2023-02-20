require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
    visit login_url

    fill_in "Email", with: 'miranto@email.com'
    fill_in "Password", with: 'password'
    click_on "Sign in"
  end

  test "visiting the index" do
    click_on @task.project.name
    visit project_task_url(@task.project, @task)
    assert_selector "h1", text: "Task"
  end

  test "should create task" do
    click_on @task.project.name
    visit project_url(@task.project)
    click_on "New task"

    fill_in "Name", with: 'Name task new'
  end

  test "should update Task" do
    click_on @task.project.name
    visit project_task_url(@task.project, @task)
    find("a.bi-pencil-square").click

    fill_in "Name", with: 'Name task updated'
    click_on "Update Task"

    assert_text "Task was successfully updated"
  end

  test "should destroy Task" do
    click_on @task.project.name
    visit project_task_url(@task.project, @task)
    find("button.bi-trash").click

    assert_text "Task was successfully destroyed"
  end
end

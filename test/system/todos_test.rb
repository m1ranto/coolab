require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
    visit login_url

    fill_in "Email", with: 'miranto@email.com'
    fill_in "Password", with: 'password'
    click_on "Sign in"
  end

  test "visiting the index" do
    click_on @todo.task.project.name
    visit project_task_todo_url(@todo.task.project, @todo.task, @todo)
    assert_selector "h1", text: "Todo"
  end

  test "should create todo" do
    click_on @todo.task.project.name
    visit project_task_url(@todo.task.project, @todo.task)
    click_on "New todo"

    fill_in "Description", with: @todo.description
    check "Done" if @todo.done
    fill_in "Due on", with: @todo.due_on
    fill_in "Name", with: @todo.name
    click_on "Create Todo"

    assert_text "Todo was successfully created"
  end

  test "should update Todo" do
    click_on @todo.task.project.name
    visit project_task_url(@todo.task.project, @todo.task)
    click_on @todo.name
    find("a.bi-pencil-square").click

    fill_in "Description", with: @todo.description
    check "Done" if @todo.done
    fill_in "Due on", with: @todo.due_on
    fill_in "Name", with: @todo.name
    click_on "Update Todo"

    assert_text "Todo was successfully updated"
  end
end

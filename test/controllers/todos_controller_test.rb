require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
    log_in_as collaborators(:miranto)
  end

  test "should get new" do
    get new_project_task_todo_url(@todo.task.project, @todo.task, @todo)
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post project_task_todos_url(@todo.task.project, @todo.task), params: { todo: { description: @todo.description, done: @todo.done, due_on: @todo.due_on, name: @todo.name, task_id: @todo.task_id } }
    end

    assert_redirected_to project_task_todo_url(@todo.task.project, @todo.task, Todo.last)
  end

  test "should show todo" do
    get project_task_todo_url(@todo.task.project, @todo.task, @todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_task_todo_url(@todo.task.project, @todo.task, @todo)
    assert_response :success
  end

  test "should update todo" do
    patch project_task_todo_url(@todo.task.project, @todo.task, @todo), params: { todo: { description: @todo.description, done: @todo.done, due_on: @todo.due_on, name: @todo.name, task_id: @todo.task_id } }
    assert_redirected_to project_task_todo_url(@todo.task.project, @todo.task, @todo)
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete project_task_todo_url(@todo.task.project, @todo.task, @todo)
    end

    assert_redirected_to project_task_todos_url(@todo.task.project, @todo.task)
  end
end

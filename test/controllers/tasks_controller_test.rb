require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get new" do
    get new_project_task_url(@task.project, @task)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post project_tasks_url(@task.project), params: { task: { name: @task.name, project_id: @task.project_id } }
    end

    assert_redirected_to project_url(@task.project)
  end

  test "should show task" do
    get project_task_url(@task.project, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_task_url(@task.project, @task)
    assert_response :success
  end

  test "should update task" do
    patch project_task_url(@task.project, @task), params: { task: { name: @task.name, project_id: @task.project_id } }
    assert_redirected_to project_url(@task.project)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete project_task_url(@task.project, @task)
    end

    assert_redirected_to project_url(@task.project)
  end
end

require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "name should be present" do
    @task.name = ""
    assert_not @task.valid?
  end
end

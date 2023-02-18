require "test_helper"

class TodoTest < ActiveSupport::TestCase
  setup do
    @todo = todos(:one)
  end

  test "should be valid" do
    assert @todo.valid?
  end

  test "name should be present" do
    @todo.name = ""
    assert_not @todo.valid?
  end
end

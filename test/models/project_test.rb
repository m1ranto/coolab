require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:coolab)
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "name should be present" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "name should not be too long" do
    @project.name = "a" * 101
    assert_not @project.valid?
  end
end

require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
  end

  test "should be valid" do
    assert @project.valid?
  end
end

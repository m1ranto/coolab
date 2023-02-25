require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "content should be present" do
    @comment.content = ""
    assert_not @comment.valid?
  end
end

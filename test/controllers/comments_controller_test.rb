require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    log_in_as collaborators(:miranto)
  end

  test "should get index" do
    get project_comments_url(@comment.project)
    assert_response :success
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post project_comments_url(@comment.project), params: { comment: { content: "comment", project_id: @comment.project_id, collaborator_id: @comment.collaborator_id } }
    end

    assert_redirected_to project_comments_url(@comment.project)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete project_comment_url(@comment.project, @comment)
    end

    assert_redirected_to project_comments_url(@comment.project)
  end
end

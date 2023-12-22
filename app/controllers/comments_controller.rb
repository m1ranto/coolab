class CommentsController < ApplicationController
  before_action :get_project
  before_action :set_comment, only: :destroy
  before_action :logged_in_collaborator
  before_action :correct_collaborator, only: :destroy

  include SessionsHelper

  # Get all project comments with new comment form
  def index
    @comments = @project.comments.all
    @comment  = @project.comments.build
  end

  # Create comment
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.turbo_stream { render turbo_stream: turbo_stream.append("comments", @comment) }
        format.html { redirect_to project_comments_path(@project) }
      else
        @comments = @project.comments.all
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # Delete comment
  def destroy
    @comment.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      format.html { redirect_to project_comments_path(@project) }
    end
  end

  private
    # Set comment
    def set_comment
      @comment = @project.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :project_id, :collaborator_id)
    end

    # Get project, as comment is nested in project route
    def get_project
      @project = Project.find(params[:project_id])
    end

    # Require correct collaborator
    def correct_collaborator
      @comment = current_collaborator.comments.find(params[:id])
      redirect_to projects_path if @comment.nil?
    end
end

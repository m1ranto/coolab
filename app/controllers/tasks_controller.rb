class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :logged_in_collaborator
  before_action :correct_organization

  include SessionsHelper

  def index
  end

  # Get task
  def show
    @tasks = @project.tasks
  end

  # Get new task
  def new
    @task = @project.tasks.build
  end

  # Edit task
  def edit
  end

  # Create task
  def create
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("tasks", @task) }
        format.html { redirect_to project_tasks_url(@project), notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # Update task
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_url(@project), notice: "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Delete task
  def destroy
    @task.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@task) }
      format.html { redirect_to project_url(@project), notice: "Task was successfully destroyed." }
    end
  end

  private
    # Set task
    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :project_id)
    end

    # Get project, as task is nested in project route
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Require correct organization
    def correct_organization
      redirect_to projects_path unless @project.collaborator.organization == current_collaborator.organization
    end
end

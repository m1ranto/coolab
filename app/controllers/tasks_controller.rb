class TasksController < ApplicationController
  before_action :get_project
    before_action :set_task, only: %i[ show edit update destroy ]
    before_action :logged_in_collaborator

    include SessionsHelper

  # Get task
  def show
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
        format.html { redirect_to project_url(@project), notice: "Task was successfully created." }
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
  def get_project
    @project = Project.find(params[:project_id])
  end
end

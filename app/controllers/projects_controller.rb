class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :logged_in_collaborator
  before_action :correct_collaborator, only: %i[ edit update destroy ]

  include SessionsHelper

  # Get all projects
  def index
    @projects = Project.all
  end

  # Get project
  def show
  end

  # Get new project
  def new
    @project = Project.new
  end

  # Edit project
  def edit
  end

  # Create project
  def create
    @project = current_collaborator.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # Update project
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Delete project
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :collaborator_id)
    end

    # Require correct collaborator
    def correct_collaborator
      @project = current_collaborator.projects.find(params[:id])
      redirect_to projects_path if @project.nil?
    end
end

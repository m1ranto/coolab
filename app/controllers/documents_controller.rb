class DocumentsController < ApplicationController
  before_action :logged_in_collaborator
  before_action :set_project
  before_action :set_document, only: %i[ show edit update destroy ]
  before_action :correct_collaborator, only: %i[ edit update destroy ]
  before_action :correct_organization
  before_action :correct_document, only: :show

  include SessionsHelper

  def index
    @documents = Document.all
  end

  def new
    @document = @project.documents.new
  end

  def show
    @documents = @project.documents
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    @document.collaborator = current_collaborator
    @document.project = @project

    respond_to do |format|
      if @document.save
        format.html { redirect_to project_document_url(@project, @document), notice: "Document was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to project_document_url(@project, @document), notice: "Document was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to project_documents_url(@project), notice: "Document was successfully destroyed." }
    end
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:name, :description, files: [])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Require correct collaborator
    def correct_collaborator
      @collaborator = @document.collaborator
      redirect_to project_documents_path unless @collaborator == current_collaborator || current_collaborator.admin?
    end

    # Require correct organization
    def correct_organization
      redirect_to projects_path unless @project.collaborator.organization == current_collaborator.organization
    end

    # Require correct document
    def correct_document
      redirect_to project_documents_path(@project) unless @project.documents.include?(@document)
    end
end
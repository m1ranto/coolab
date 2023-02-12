class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: %i[ show edit update destroy ]
  before_action :logged_in_collaborator, except: %i[ new create ]
  before_action :correct_collaborator, only: %i[ edit update destroy ]

  include SessionsHelper

  # GET /collaborators or /collaborators.json
  def index
    @collaborators = Collaborator.all
  end

  # GET /collaborators/1 or /collaborators/1.json
  def show
  end

  # GET /collaborators/new
  def new
    @collaborator = Collaborator.new
  end

  # GET /collaborators/1/edit
  def edit
  end

  # POST /collaborators or /collaborators.json
  def create
    @collaborator = Collaborator.new(collaborator_params)

    respond_to do |format|
      if @collaborator.save
        log_in @collaborator
        format.html { redirect_to collaborator_url(@collaborator), notice: "Collaborator was successfully created." }
        format.json { render :show, status: :created, location: @collaborator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborators/1 or /collaborators/1.json
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to collaborator_url(@collaborator), notice: "Collaborator was successfully updated." }
        format.json { render :show, status: :ok, location: @collaborator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborators/1 or /collaborators/1.json
  def destroy
    @collaborator.destroy

    respond_to do |format|
      format.html { redirect_to collaborators_url, notice: "Collaborator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collaborator_params
      params.require(:collaborator).permit(:name, :email, :title, :password, :password_confirmation)
    end

    # Require logged-in collaborator
    def logged_in_collaborator
      unless logged_in?
        redirect_to login_path
      end
    end

    # Require correct collaborator
    def correct_collaborator
      @collaborator = Collaborator.find(params[:id])
      redirect_to collaborators_path unless @collaborator == current_collaborator
    end
end

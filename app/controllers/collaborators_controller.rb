class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: %i[ show edit update destroy ]
  before_action :logged_in_collaborator, except: %i[ new create ]
  before_action :correct_collaborator, only: %i[ edit update destroy ]

  include SessionsHelper

  # Get all collaborators
  def index
    @collaborators = Collaborator.all
  end

  # Get collaborator
  def show
  end

  # Get new collaborator
  def new
    redirect_to collaborators_path if logged_in?
    @collaborator = Collaborator.new
  end

  # Invite new collaborator by email
  def invite
    email = params[:email]
    InvitationMailer.invite_collaborator(email).deliver_later
    redirect_to collaborators_url, notice: "Invitation was sent to #{email}"
  end

  # Edit collaborator
  def edit
  end

  # Create collaborator
  def create
    if organization_name = params[:collaborator][:organization_name]
      # create collaborator and create new organization
      @organization = Organization.create!(name: organization_name)
      @collaborator = @organization.collaborators.new(collaborator_params)
    else
      # create collaborator to join existing organization
      @collaborator = Collaborator.new(collaborator_params)
    end

    @collaborator.profile = profile_color

    respond_to do |format|
      if @collaborator.save
        log_in @collaborator
        format.html { redirect_to collaborator_url(@collaborator), notice: "Collaborator was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # Update collaborator
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to collaborator_url(@collaborator), notice: "Collaborator was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Delete collaborator
  def destroy
    @collaborator.destroy

    respond_to do |format|
      format.html { redirect_to collaborators_url, notice: "Collaborator was successfully destroyed." }
    end
  end

  private
    # Set collaborator
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collaborator_params
      params.require(:collaborator).permit(:name, :email, :title, :organization_id, :password, :password_confirmation, :profile_picture)
    end

    # Require correct collaborator
    def correct_collaborator
      @collaborator = Collaborator.find(params[:id])
      redirect_to collaborators_path unless @collaborator == current_collaborator
    end

    # Generate random background-color profile in hsl
    def profile_color
      "hsl(#{rand 360}, #{rand 100}%, #{rand 60}%)"
    end
end

class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show invite join edit update destroy ]
  before_action :logged_in_collaborator, except: %i[ new create join ]

  include SessionsHelper

  # Get new organization
  def new
    @organization = Organization.new
  end

  def invite
    @token = SecureRandom.urlsafe_base64
    @organization.invitation_token = @token
    @organization.save
  end

  def join
    redirect_to projects_url if logged_in?

    if @organization.invitation_token == params[:invitation_id] && @organization.updated_at > 1.hour.ago
      @collaborator = Collaborator.new
    else
      redirect_to root_url
    end
  end

  # Edit organization
  def edit
  end

  # Create organization
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        log_in @organization
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Set organization
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name, :description, :organization_id)
    end
end

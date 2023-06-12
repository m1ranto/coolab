class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]
  before_action :logged_in_collaborator, except: %i[ new create ]

  include SessionsHelper

  # Get new organization
  def new
    @organization = Organization.new
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

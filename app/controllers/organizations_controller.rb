class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ invite join edit update destroy ]
  before_action :logged_in_collaborator, except: :join
  before_action :admin_collaborator, only: %i[ invite edit ]

  include SessionsHelper

  def invite
    @token = SecureRandom.urlsafe_base64
    @organization.invitation_token = @token
    @organization.save
  end

  def join
    return redirect_to projects_url if logged_in?

    if @organization.invitation_token == params[:invitation_id] && @organization.updated_at > 1.hour.ago
      @collaborator = Collaborator.new
    else
      redirect_to root_url
    end
  end

  # Edit organization
  def edit
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to collaborators_url, notice: 'Organization was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization.destroy
    redirect_to root_url
  end

  private
    # Set organization
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name)
    end

    # Require admin collaborator
    def admin_collaborator
      return redirect_to collaborators_url unless current_collaborator.admin?
    end
end

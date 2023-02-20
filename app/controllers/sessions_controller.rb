class SessionsController < ApplicationController
  include SessionsHelper

  def new
    redirect_to root_path if logged_in?
  end

  def create
    collaborator = Collaborator.find_by(email: params[:email])
    if collaborator && collaborator.authenticate(params[:password])
      log_in collaborator
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end

class ApplicationController < ActionController::Base
  # Require logged-in collaborator
  def logged_in_collaborator
    unless logged_in?
      redirect_to login_path
    end
  end
end

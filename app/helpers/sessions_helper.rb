module SessionsHelper

  # Log in a collaborator
  def log_in(collaborator)
    session[:collaborator_id] = collaborator.id
  end

  # Current collaborator logged-in
  def current_collaborator
    @current_collaborator ||= Collaborator.find_by(id: session[:collaborator_id])
  end

  # Check if any collaborator is logged in
  def logged_in?
    !current_collaborator.nil?
  end

  # Log out a collaborator
  def log_out
    session.delete(:collaborator_id)
    @current_collaborator = nil
  end
end

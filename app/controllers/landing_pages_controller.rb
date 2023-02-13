class LandingPagesController < ApplicationController

  layout 'landingpage'

  include SessionsHelper

  def index
    if logged_in?
      redirect_to collaborators_path
    end
  end
end

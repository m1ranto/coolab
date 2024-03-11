class LandingPagesController < ApplicationController

  layout 'landingpage'

  include SessionsHelper

  def index
=begin
    if logged_in?
      redirect_to projects_path
    end
=end
  end
end

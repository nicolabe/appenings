class ApplicationController < ActionController::Base
  layout 'readable'

  protect_from_forgery

  def after_sign_in_path_for(resource)
    appenings_path
  end
end

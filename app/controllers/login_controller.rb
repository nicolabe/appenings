class LoginController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to appenings_path
  	end
  end
end

class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:show]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to do that."
    redirect_to(request.referrer || root_path)
  end
end

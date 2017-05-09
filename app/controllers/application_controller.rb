class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  private

  def set_current_user
    @current_user = User.find_or_create_by id: session[:user_id]
    session[:user_id] = @current_user.id
  end

end

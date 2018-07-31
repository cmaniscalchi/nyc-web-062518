class ApplicationController < ActionController::Base
  # before you do anything make sure i'm authorized
  before_action :authorized
  helper_method :logged_in?, :current_user

  def current_user
    # find_by will return nil which is falsey if the user is not found
    # or return the ruby instance which is truthy
    @user = User.find_by(id: session[:logged_in_user_id])
  end

  def logged_in?
    !!current_user #coerce the current_user into a boolean
  end

  def authorized
    unless logged_in?
      flash[:notice] = "You must be logged in to see this page"
      redirect_to new_session_path
    end
  end
end

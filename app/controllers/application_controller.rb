class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    if @user
      return @user
    else
      @user = User.find_by(id: session["user_id"])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    flash["notice"] = "You must be logged in to view that page."
    redirect_to login_path unless logged_in?
  end
end

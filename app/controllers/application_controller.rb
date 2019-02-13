class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :is_current_user?

  def current_user
    if @logged_in_user
      return @logged_in_user
    else
      @logged_in_user = User.find_by(id: session["user_id"])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    flash["notice"] = "You must be logged in to view that page."
    redirect_to login_path unless logged_in?
  end

  def is_current_user?
    @user && @user == current_user
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  # private

  # def record_not_found
  #   render text: "404 Not Found", status: 404
  # end
end

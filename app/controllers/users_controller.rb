class UsersController < ApplicationController
  before_action :authorized

  helper_method :is_current_user?

  def show
    @user = User.find_by(username: params[:username]) or not_found
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def is_current_user?
    @user && @user == current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :birthday, :password, :password_confirmation)
  end
end

class UsersController < ApplicationController
  before_action :authorized
  before_action :get_user, only: %i(show find_matches)

  helper_method :is_current_user?

  def show
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

  def find_matches
    @user.generate_matches
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :birthday, :password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(username: params[:username]) or not_found
  end
end

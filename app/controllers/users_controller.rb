class UsersController < ApplicationController
  before_action :authorized, except: %i(new create)
  before_action :get_user, only: %i(show edit update destroy find_matches)
  before_action :verify_user, only: %i(edit update destroy)

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session.clear
    flash["notice"] = nil
    redirect_to login_path
  end

  def find_matches
    @user.generate_matches
    redirect_to @user
  end

  def search
    @results = User.search(params[:q])    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :birthday, :avatar, :password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(username: params[:username]) or not_found
  end

  def verify_user
    is_current_user? or redirect_to @user
  end
end

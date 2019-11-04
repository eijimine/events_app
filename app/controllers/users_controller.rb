class UsersController < ApplicationController
  def new
  end

  def index
    @users = User.all
  end

  def create
    puts params
    @user = User.new(user_params) 
    @user.save
    redirect_to users_path
  end

  def show
    @user = user.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end
end

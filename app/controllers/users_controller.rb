class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params) 
    @user.save
    redirect_to @user
  end

  def show
    @user = user.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:id, :name)
  end
end

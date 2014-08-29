class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p user_params
    @user.save
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
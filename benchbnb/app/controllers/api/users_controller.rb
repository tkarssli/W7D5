class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      # redirect_to index
    else
      render json: @user.errors.full_messages, status: 401
      # render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end

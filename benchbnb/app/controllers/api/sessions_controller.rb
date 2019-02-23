class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      # redirect_to somewhere
    else
      render json: {
        message: "you wrong",
      },
      status: 401 
    end
  end

  def destroy
    if current_user 
      logout!
      render json: {}
    else 
      render json: {
        message: "no one home",
      },
      status: 401
    end
  end


end
